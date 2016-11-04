//
//  Card.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 26/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation
import UIKit


public typealias CardTypeCallback = (Card?, NSError?) -> Void


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
	
	
	
	
	public init?(id: String,
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
	}
	
	public init?(fromJSON jsonData: Data){
		
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
		
		
		
		let request = CardRequest(withURL: WalletAPIClient.getResourceURL(type: APIResources.ListCreditCard), httpMethod: .GET) { (card, error) -> Void in
				print("CardRequest")
				print("\(card), \(error)")
		}
		
		request.begin()
		
		
		/*var request = URLRequest(url: WalletAPIClient.getResourceURL(type: APIResources.ListCreditCard) )
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = WalletAPIClient.getAuthHeaders()*/
		
		
		
		/*let session = URLSession.shared
		let task = session.dataTask(with: request) { (data, response, error) -> Void in
			
			let httpResponse = response as! HTTPURLResponse
			let statusCode = httpResponse.statusCode
			
			if statusCode == 200 {
				
				print("Everyone is fine")
				
				do{
					let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
					print("\(json)")
				}catch{
					print("Error with Json: \(error)")
				}
			}else{
				print("Fail ListCardsWithCustomerId")
			}
		}
		
		task.resume()*/
	}
	
}
