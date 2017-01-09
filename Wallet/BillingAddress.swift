//
//	BillingAddres.swift
//
//	Create by Jaime Costa Marques on 2/12/2016
//	Copyright © 2016. All rights reserved.

import Foundation

class BillingAddres : NSObject, NSCoding{
	
	var city : String!
	var complement : String!
	var country : String!
	var neighborhood : String!
	var number : String!
	var state : String!
	var street : String!
	var zipCode : String!
	
	
	/**
	* Instantiate the instance using the passed dictionary values to set the properties values
	*/
	init(fromDictionary dictionary: NSDictionary){
		city = dictionary["city"] as? String
		complement = dictionary["complement"] as? String
		country = dictionary["country"] as? String
		neighborhood = dictionary["neighborhood"] as? String
		number = dictionary["number"] as? String
		state = dictionary["state"] as? String
		street = dictionary["street"] as? String
		zipCode = dictionary["zip_code"] as? String
	}
	
	/**
	* Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	*/
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if city != nil{
			dictionary["city"] = city
		}
		if complement != nil{
			dictionary["complement"] = complement
		}
		if country != nil{
			dictionary["country"] = country
		}
		if neighborhood != nil{
			dictionary["neighborhood"] = neighborhood
		}
		if number != nil{
			dictionary["number"] = number
		}
		if state != nil{
			dictionary["state"] = state
		}
		if street != nil{
			dictionary["street"] = street
		}
		if zipCode != nil{
			dictionary["zip_code"] = zipCode
		}
		return dictionary
	}
	
	/**
	* NSCoding required initializer.
	* Fills the data from the passed decoder
	*/
	@objc required init(coder aDecoder: NSCoder)
	{
		city = aDecoder.decodeObject(forKey: "city") as? String
		complement = aDecoder.decodeObject(forKey: "complement") as? String
		country = aDecoder.decodeObject(forKey: "country") as? String
		neighborhood = aDecoder.decodeObject(forKey: "neighborhood") as? String
		number = aDecoder.decodeObject(forKey: "number") as? String
		state = aDecoder.decodeObject(forKey: "state") as? String
		street = aDecoder.decodeObject(forKey: "street") as? String
		zipCode = aDecoder.decodeObject(forKey: "zip_code") as? String
		
	}
	
	/**
	* NSCoding required method.
	* Encodes mode properties into the decoder
	*/
	@objc func encode(with aCoder: NSCoder)
	{
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if complement != nil{
			aCoder.encode(complement, forKey: "complement")
		}
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if neighborhood != nil{
			aCoder.encode(neighborhood, forKey: "neighborhood")
		}
		if number != nil{
			aCoder.encode(number, forKey: "number")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if street != nil{
			aCoder.encode(street, forKey: "street")
		}
		if zipCode != nil{
			aCoder.encode(zipCode, forKey: "zip_code")
		}
		
	}
	
}
