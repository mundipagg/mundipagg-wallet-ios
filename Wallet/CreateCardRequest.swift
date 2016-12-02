//
//  CreateCard.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 02/12/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


class CreateCardRequest : NSObject, NSCoding{
	
	var billingAddress : BillingAddres!
	var cvv : Int!
	var expMonth : Int!
	var expYear : Int!
	var holderName : String!
	var number : Int!
	
	
	
	init?(number : Int, expMonth : Int, expYear : Int, cvv : Int, holderName : String, billingAddress : BillingAddres?){
		if billingAddress != nil{
			self.billingAddress = billingAddress
		}
		self.cvv = cvv
		self.expMonth = expMonth
		self.expYear = expYear
		self.holderName = holderName
		self.number = number
	}
	
	
	/**
	* Instantiate the instance using the passed dictionary values to set the properties values
	*/
	init(fromDictionary dictionary: NSDictionary){
		if let billingAddressData = dictionary["billing_address"] as? NSDictionary{
			billingAddress = BillingAddres(fromDictionary: billingAddressData)
		}
		cvv = dictionary["cvv"] as? Int
		expMonth = dictionary["exp_month"] as? Int
		expYear = dictionary["exp_year"] as? Int
		holderName = dictionary["holder_name"] as? String
		number = dictionary["number"] as? Int
	}
	
	/**
	* Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	*/
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		
		if billingAddress != nil{
			dictionary["billing_address"] = billingAddress.toDictionary()
		}
		if cvv != nil{
			dictionary["cvv"] = cvv
		}
		if expMonth != nil{
			dictionary["exp_month"] = expMonth
		}
		if expYear != nil{
			dictionary["exp_year"] = expYear
		}
		if holderName != nil{
			dictionary["holder_name"] = holderName
		}
		if number != nil{
			dictionary["number"] = number
		}
		return dictionary
	}
	
	/**
	* NSCoding required initializer.
	* Fills the data from the passed decoder
	*/
	@objc required init(coder aDecoder: NSCoder)
	{
		billingAddress = aDecoder.decodeObject(forKey: "billing_address") as? BillingAddres
		cvv = aDecoder.decodeObject(forKey: "cvv") as? Int
		expMonth = aDecoder.decodeObject(forKey: "exp_month") as? Int
		expYear = aDecoder.decodeObject(forKey: "exp_year") as? Int
		holderName = aDecoder.decodeObject(forKey: "holder_name") as? String
		number = aDecoder.decodeObject(forKey: "number") as? Int
		
	}
	
	/**
	* NSCoding required method.
	* Encodes mode properties into the decoder
	*/
	@objc func encode(with aCoder: NSCoder)
	{
		if billingAddress != nil{
			aCoder.encode(billingAddress, forKey: "billing_address")
		}
		if cvv != nil{
			aCoder.encode(cvv, forKey: "cvv")
		}
		if expMonth != nil{
			aCoder.encode(expMonth, forKey: "exp_month")
		}
		if expYear != nil{
			aCoder.encode(expYear, forKey: "exp_year")
		}
		if holderName != nil{
			aCoder.encode(holderName, forKey: "holder_name")
		}
		if number != nil{
			aCoder.encode(number, forKey: "number")
		}
		
	}

	
}
