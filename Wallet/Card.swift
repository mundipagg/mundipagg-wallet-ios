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


public struct Card {
	
	// The card id
	public let id: String
	
	// The Mundipagg MarkOne gateway key
	public let gatewayId: String?
	
	// The last card digits
	public let lastFourDigits: String?
	
	// The card brand
	public let brand: CardBrand?
	
	// The Card Status
	public let status: CardStatus?

	// The card holder name
	public let holderName: String?
	
	// The card created date
	public let createdAt: Date?
	
	// The card last update date
	public let updatedAt: Date?
	
	// Card cilling address
	public let billingAddress: Address?
	
	
	
	/*public init?(id: String,
	            gatewayId: String? = nil,
	            lastFourDigits: String? = nil,
	            brand: CardBrand? = nil,
	            status: CardStatus? = nil,
	            holderName: String? = nil,
	            createdAt: Date? = nil,
	            updatedAt: Date? = nil,
	            billingAddress: Address? = nil){
		self.id = id
		self.gatewayId = gatewayId
		self.lastFourDigits = lastFourDigits
		self.brand = brand
		self.status = status
		self.holderName = holderName
		self.createdAt = createdAt
		self.updatedAt = updatedAt
		self.billingAddress = billingAddress
	}*/
	
	/*public init?(fromJSON jsonData: Data){
		
		
		guard let json = (try? JSONSerialization.jsonObject(with: jsonData, options: [])) as? [String: Any],
			let id = json["id"] as? String,
			let gatewayId = json["gateway_id"] as? String,
			let lastFourDigits = json["lastFourDigits"] as? String,
			let brand = json["brand"] as? String,
			let status = json["status"] as? String,
			let holderName = json["holderName"] as? String,
			let createdAt = (json["createdAt"] as? String)?.dateFromISO8601Format,
			let updatedAt = (json["updatedAt"] as? String)?.dateFromISO8601Format,
			let billingAddress = json["billingAddress"] as? AnyObject

			else {
				return nil
		}
		
		self.id = id
		self.gatewayId = gatewayId
		self.lastFourDigits = lastFourDigits
		self.brand = .Visa
		self.status = .active
		self.holderName = holderName
		self.createdAt = createdAt
		self.updatedAt = updatedAt
		self.billingAddress = Address()
	}*/
	
    public init?(fromDictionary json: Dictionary<String,Any>) {
		
		
		
		guard let id = json["id"] as? String,
			let gatewayId = json["gateway_id"] as? String,
			let lastFourDigits = json["last_four_digits"] as? String,
			let brand = json["brand"] as? String,
			let status = json["status"] as? String,
			let holderName = json["holder_name"] as? String,
			let createdAt = (json["created_at"] as? String)?.dateFromISO8601Format,
			let updatedAt = (json["updated_at"] as? String)?.dateFromISO8601Format
		else {
			return nil
		}
		
		// Optional billing address must be outside guard statement
		if let billingAddress = json["billing_address"] as? AnyObject {
			print("Good Billing Address", billingAddress)
		}else{
			print("Bad Billing Address")
		}
		
		self.id = id
		self.gatewayId = gatewayId
		self.lastFourDigits = lastFourDigits
		self.brand = CardBrand(rawValue: brand)
		self.status = CardStatus(rawValue: status)
		self.holderName = holderName
		self.createdAt = createdAt
		self.updatedAt = updatedAt
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
		
        let request = CardRequest(withURL: WalletAPIClient.getResourceURL(type: APIResources.ListCreditCard), httpMethod: WalletHTTPMethod.GET)

        
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
									
									if let card = Card(fromDictionary: cardDictionary) {
										cards.append(card)
									}
                        }
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
	
}
