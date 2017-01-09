//
//  Customer.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 27/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


public class Customer : NSObject, NSCoding {
	
	
	var id: String!
	
	var name: String?
	
	var email: String?
	
	var delinquent: Bool?
	
	var createdAt: Date?
	
	var updatedAt: Date?
	
	var phone : String?
	
	
	init?(id: String,
					name: String? = nil,
					email: String? = nil,
					delinquent: Bool? = false,
					createdAt: Date? = nil,
					updatedAt: Date? = nil,
					phone: String? = nil){
	
		self.id = id
		self.name = name
		self.email = email
		self.delinquent = delinquent
		self.createdAt = createdAt
		self.updatedAt = updatedAt
		self.phone = phone
	
	}
	
	/**
	* Instantiate the instance using the passed dictionary values to set the properties values
	*/
	init(fromDictionary dictionary: NSDictionary){
		createdAt = (dictionary["created_at"] as? String)?.dateFromISO8601Format
		delinquent = dictionary["delinquent"] as? Bool
		email = dictionary["email"] as? String
		id = dictionary["id"] as? String
		name = dictionary["name"] as? String
		phone = dictionary["phone"] as? String
		updatedAt = (dictionary["updated_at"] as? String)?.dateFromISO8601Format
	}
	
	/**
	* Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	*/
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if delinquent != nil{
			dictionary["delinquent"] = delinquent
		}
		if email != nil{
			dictionary["email"] = email
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if phone != nil{
			dictionary["phone"] = phone
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
		createdAt = (aDecoder.decodeObject(forKey: "created_at") as? String)?.dateFromISO8601Format
		delinquent = aDecoder.decodeObject(forKey: "delinquent") as? Bool
		email = aDecoder.decodeObject(forKey: "email") as? String
		id = aDecoder.decodeObject(forKey: "id") as? String
		name = aDecoder.decodeObject(forKey: "name") as? String
		phone = aDecoder.decodeObject(forKey: "phone") as? String
		updatedAt = (aDecoder.decodeObject(forKey: "updated_at") as? String)?.dateFromISO8601Format
		
	}
	
	/**
	* NSCoding required method.
	* Encodes mode properties into the decoder
	*/
	@objc public func encode(with aCoder: NSCoder)
	{
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if delinquent != nil{
			aCoder.encode(delinquent, forKey: "delinquent")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if phone != nil{
			aCoder.encode(phone, forKey: "phone")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		
	}
	
}

//--------------------------------------
// MARK: - Loading Customer
//--------------------------------------


extension Customer{
	
	public static func fetch(id: String){
		
	}
}
