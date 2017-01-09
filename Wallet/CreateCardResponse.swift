//
//  CreateCardResponse.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 06/01/17.
//  Copyright © 2017 Buy4. All rights reserved.
//

import Foundation


public class CreateCardResponse : NSObject, NSCoding{
	
	public var brand : String!
	
	public var createdAt : Date!
	
	public var customer : Customer!
	
	public var holderName : String!
	
	public var id : String!
	
	public var lastFourDigits : String!
	
	public var status : String!
	
	public var updatedAt : Date!
	
	
	/**
	* Instantiate the instance using the passed dictionary values to set the properties values
	*/
	init?(fromDictionary dictionary: NSDictionary){
		brand = dictionary["brand"] as? String
		createdAt = (dictionary["created_at"] as? String)?.dateFromISO8601Format
		if let customerData = dictionary["customer"] as? NSDictionary{
			customer = Customer(fromDictionary: customerData)
		}
		holderName = dictionary["holder_name"] as? String
		id = dictionary["id"] as? String
		lastFourDigits = dictionary["last_four_digits"] as? String
		status = dictionary["status"] as? String
		updatedAt = (dictionary["updated_at"] as? String)?.dateFromISO8601Format
	}
	
	/**
	* Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	*/
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if brand != nil{
			dictionary["brand"] = brand
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if customer != nil{
			dictionary["customer"] = customer.toDictionary()
		}
		if holderName != nil{
			dictionary["holder_name"] = holderName
		}
		if id != nil{
			dictionary["id"] = id
		}
		if lastFourDigits != nil{
			dictionary["last_four_digits"] = lastFourDigits
		}
		if status != nil{
			dictionary["status"] = status
		}
		if updatedAt != nil{
			dictionary["updated_at"] = updatedAt
		}
		return dictionary
	}
	
	/**
	* NSCoding required initializer.
	* Fills the data from the passed decoder
	*/
	@objc required public init(coder aDecoder: NSCoder)
	{
		brand = aDecoder.decodeObject(forKey: "brand") as? String
		createdAt = (aDecoder.decodeObject(forKey: "created_at") as? String)?.dateFromISO8601Format
		customer = aDecoder.decodeObject(forKey: "customer") as? Customer
		holderName = aDecoder.decodeObject(forKey: "holder_name") as? String
		id = aDecoder.decodeObject(forKey: "id") as? String
		lastFourDigits = aDecoder.decodeObject(forKey: "last_four_digits") as? String
		status = aDecoder.decodeObject(forKey: "status") as? String
		updatedAt = (aDecoder.decodeObject(forKey: "updated_at") as? String)?.dateFromISO8601Format
		
	}
	
	/**
	* NSCoding required method.
	* Encodes mode properties into the decoder
	*/
	@objc public func encode(with aCoder: NSCoder)
	{
		if brand != nil{
			aCoder.encode(brand, forKey: "brand")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if customer != nil{
			aCoder.encode(customer, forKey: "customer")
		}
		if holderName != nil{
			aCoder.encode(holderName, forKey: "holder_name")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if lastFourDigits != nil{
			aCoder.encode(lastFourDigits, forKey: "last_four_digits")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		
	}
	
}
