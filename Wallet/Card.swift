//
//  Card.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 26/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation
import UIKit


public typealias CardTypeCallback = ([Card]?, WalletError?) -> Void
public typealias CardTypeCreateCallback = (CreateCardResponse?, WalletError?) -> Void
public typealias CardTypeDeleteCallback = (DeleteCardResponse?, WalletError?) -> Void

public struct Card {
	
	/// The card id
	public let id: String
	
	/// The Mundipagg MarkOne gateway key
	public let gatewayId: String?
	
	/// The last card digits
	public let lastFourDigits: String?
	
	/// The card brand
	public let brand: CardBrand?
	
	/// The Card Status
	public let status: CardStatus?

	/// The card holder name
	public let holderName: String?
	
	/// The card created date
	public let createdAt: Date?
	
	/// The card last update date
	public let updatedAt: Date?
	
	/// Card cilling address
	public let billingAddress: Address?
	
	public init?(id: String,
	            gatewayId: String? = nil,
	            lastFourDigits: String? = nil,
	            brand: CardBrand? = nil,
	            status: CardStatus? = nil,
	            holderName: String? = nil,
	            createdAt: Date? = nil,
	            updatedAt: Date? = nil,
	            billingAddress: Address? = nil,
	            options: CardOptions? = nil) {
		self.id = id
		self.gatewayId = gatewayId
		self.lastFourDigits = lastFourDigits
		self.brand = brand
		self.status = status
		self.holderName = holderName
		self.createdAt = createdAt
		self.updatedAt = updatedAt
		self.billingAddress = billingAddress
	}
	
    public init?(fromDictionary json: Dictionary<String,Any>) {
		
		guard let id = json["id"] as? String,
			let lastFourDigits = json["last_four_digits"] as? String,
			let brand = json["brand"] as? String,
			let status = json["status"] as? String,
			let holderName = json["holder_name"] as? String
		else {
			return nil
		}
		
		if let gatewayId = json["gateway_id"] as? String {
			self.gatewayId = gatewayId
		} else {
			self.gatewayId = nil
		}
		
		if let createdAt = (json["created_at"] as? String)?.dateFromISO8601Format {
			self.createdAt = createdAt
		} else {
			self.createdAt = nil
		}
		
		if let updatedAt = (json["updated_at"] as? String)?.dateFromISO8601Format {
			self.updatedAt = updatedAt
		} else {
			self.updatedAt = nil
		}
		
		self.id = id
		self.lastFourDigits = lastFourDigits
		self.brand = CardBrand(rawValue: brand)
		self.status = CardStatus(rawValue: status)
		self.holderName = holderName
		self.billingAddress = Address()
    }
    
}


//--------------------------------------
// MARK: - List Cards
//--------------------------------------

extension Card {
	
	
	public static func fetchCardsWithCustomerId(customerId: String? = nil, completion: @escaping CardTypeCallback){
		
		if customerId != nil{
			WalletAPIClient.setCustomerId(id: customerId)
		}
		
		let request = CardRequest(withURL: WalletAPIClient.getResourceURL(type: APIResources.ListCreditCardOrCreate), httpMethod: WalletHTTPMethod.GET, payload: nil)

		
        request.sendRequest { (jsonDictionary, error) in
            
            if let error = error {
					let requestError = WalletError(code: error.code, description: error.localizedDescription)
               completion(nil, requestError)
            }
            else {
                var cards = [Card]()
                
                if let jsonDictionary = jsonDictionary {
                    
                    if let cardListDictionary = jsonDictionary["data"] {
							
                        let cardList = cardListDictionary as! [Dictionary<String,Any>]
							
                        for cardDictionary in cardList {
									debugPrint("cartao esta vazio: \(cardDictionary.isEmpty)")
									
									if let card = Card(fromDictionary: cardDictionary) {
										cards.append(card)
									}
									else {
										debugPrint("nao conseguiu parsear card")
									}
                        }
								debugPrint(cards.count)
                        completion(cards, nil)
                    }
                    else {
                        completion(nil, WalletError.APIResponseError)
                    }
                }
                else {
                    completion(nil, WalletError.APIResponseError)
                }
            }
        }
	}
	
	public static func createNewCard(forCustomerId: String? = nil, payload: [String : Any],  completion: @escaping CardTypeCreateCallback){
		
		
		if forCustomerId != nil{
			WalletAPIClient.setCustomerId(id: forCustomerId)
		}
		
		do {
			let jsonData = try JSONSerialization.data(withJSONObject: payload, options: [])
			let request = CardRequest(withURL: WalletAPIClient.getResourceURL(type: APIResources.ListCreditCardOrCreate), httpMethod: WalletHTTPMethod.POST, payload: jsonData)
			
			request.sendRequest { (jsonDictionary, error) in
				
				if let error = error {
					let requestError = WalletError(code: error.code, description: error.localizedDescription)
					completion(nil, requestError)
				} else {
					
					if let card = CreateCardResponse(fromDictionary: jsonDictionary! as NSDictionary) {
						completion(card, nil)
					} else {
						completion(nil, WalletError.APIResponseError)
					}
            }
			}
		}
		catch let parseError {
			let caughtError = parseError as NSError
			completion(nil, WalletError(code: caughtError.code, description: caughtError.localizedDescription))
		}
	}
}

//--------------------------------------
// MARK: - Delete a Card
//--------------------------------------

extension Card {
    
    public static func deleteCard(forCustomerId customerId: String?, withId cardId: String, completion: @escaping CardTypeDeleteCallback) {
        
        guard customerId != nil else {
            return completion(nil, WalletError.EmptyCustomerIDError)
        }
        
        WalletAPIClient.setCustomerId(id: customerId)
        WalletAPIClient.setCardId(id: cardId)
        
        let deleteRequest = CardRequest(withURL: WalletAPIClient.getResourceURL(type: APIResources.DeleteCreditCard), httpMethod: WalletHTTPMethod.DELETE, payload: nil)
        
        deleteRequest.sendRequest{(jsonDictionary, error) in
            guard error == nil else {
                return completion(nil, error as? WalletError)
            }
            guard let deleteResponse = DeleteCardResponse.init(from: jsonDictionary!) else {
                return completion(nil, WalletError.ParseDeleteResponseError)
            }
            completion(deleteResponse, nil)
            }
        }
}
