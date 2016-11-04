//
//  Customer.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 27/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


public struct Customer {
	
	
	public let id: String
	
	public let name: String?
	
	public let email: String?
	
	public let delinquent: Bool
	
	public let createdAt: Date?
	
	public let updatedAt: Date?
	
	
	public init(id: String,
					name: String? = nil,
					email: String? = nil,
					delinquent: Bool,
					createdAt: Date? = nil,
					updatedAt: Date? = nil){
	
		self.id = id
		self.name = name
		self.email = email
		self.delinquent = delinquent
		self.createdAt = createdAt
		self.updatedAt = updatedAt
	}

	
}

//--------------------------------------
// MARK: - Loading Customer
//--------------------------------------


extension Customer{
	
	public static func fetch(id: String){
		
	}
}
