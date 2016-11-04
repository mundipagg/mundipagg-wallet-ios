//
//  Address.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 27/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


public struct Address{
	
	// The address street
	public let street: String?
	
	// The address number
	public let number: Int?
	
	// The postal / zip code of the address
	public let zipCode: Int?
	
	// The neighborhood of the address
	public let neighborhood: String?
	
	// The address city
	public let city: String?
	
	// The address state
	public let state: String?
	
	// The address country
	public let country: String?
	
	/**
	 Creates a new address instance
	 - parameter street:			Address street
	 - parameter number:			Address number
	 - parameter zipCode:		Postal / zip code of the address
	 - parameter neighborhood:	Neighborhood of the address
	 - parameter city:			Address city
	 - parameter state:			Address state
	 - parameter country:		Address country
	*/
	public init(street: String? = nil, number: Int? = nil, zipCode: Int? = nil, neighborhood: String? = nil, city: String? = nil, state: String? = nil, country: String = "BR"){
		self.street = street
		self.number = number
		self.zipCode = zipCode
		self.neighborhood = neighborhood
		self.city = city
		self.state = state
		self.country = country
	}
}
