//
//  DeleteCardResponse.swift
//  Wallet
//
//  Created by Breno Aboud on 23/01/17.
//  Copyright © 2017 Buy4. All rights reserved.
//

import Foundation

public struct DeleteCardResponse : ModelResponseProtocol {
	
	public var id: String?
	public var gatewayId: String?
	public var lastFourDigits: String?
	public var brand: String?
	public var holderName: String?
	public var expirateYear: String?
	public var expirateMonth: String?
	public var status: String?
	public var createdAt: Date?
	public var updatedAt: Date?
	public var deletedAt: Date?
	public var billingAddress: Address?
	public var customer: Customer?
	
	init?(from json: JSON) {
		
		if let id = json["id"] as? String {
			self.id = id
		}
		else {
			self.id = nil
		}
		
		if let gatewayId = json["gateway_id"] as? String {
			self.gatewayId = gatewayId
		}
		else {
			self.gatewayId = nil
		}
		
		if let lastFourDigits = json["last_four_digits"] as? String {
			self.lastFourDigits = lastFourDigits
		}
		else {
			self.lastFourDigits = nil
		}
		
		if let brand = json["brand"] as? String {
			self.brand = brand
		}
		else {
			self.brand = nil
		}
		
		if let holderName = json["holder_name"] as? String {
			self.holderName = holderName
		}
		else {
			self.holderName = nil
		}
		
		if let expirateMonth = json["exp_month"] as? String {
			self.expirateMonth = expirateMonth
		}
		else {
			self.expirateMonth = nil
		}
		
		if let expirateYear = json["exp_year"] as? String {
			self.expirateYear = expirateYear
		}
		else {
			self.expirateYear = nil
		}
		
		if let status = json["status"] as? String {
			self.status = status
		}
		else {
			self.status = nil
		}
		
		if let createdAt = (json["created_at"] as? String)?.dateFromISO8601Format {
			self.createdAt = createdAt
		}
		else {
			self.createdAt = nil
		}
		
		if let updatedAt = (json["updated_at"] as? String)?.dateFromISO8601Format {
			self.updatedAt = updatedAt
		}
		else {
			self.updatedAt = nil
		}
		
		if let deletedAt = (json["deleted_at"] as? String)?.dateFromISO8601Format {
			self.deletedAt = deletedAt
		}
		else {
			self.deletedAt = nil
		}
		
		if let billingAddress = json["billing_address"] as? Address {
			self.billingAddress = billingAddress
		}
		else {
			self.billingAddress = nil
		}
		
		if let customer = json["customer"] as? NSDictionary {
			self.customer = Customer(fromDictionary: customer)
		}
		else {
			self.customer = nil
		}
	}
	
	
	
	
	func toJson() -> JSON {
		
		var json = JSON()
		
		if id != nil {
			json["id"] = id
		}
		
		if gatewayId != nil {
			json["gateway_id"] = gatewayId
		}
		
		if lastFourDigits != nil {
			json["last_four_digits"] = lastFourDigits
		}
		
		if brand != nil {
			json["brand"] = brand
		}
		
		if holderName != nil {
			json["holder_name"] = holderName
		}
		
		if expirateMonth != nil {
			json["exp_month"] = expirateMonth
		}
		
		if expirateYear != nil {
			json["exp_year"] = expirateYear
		}
		
		if status != nil {
			json["status"] = status
		}
		
		if createdAt != nil {
			json["created_at"] = createdAt
		}
		
		if updatedAt != nil {
			json["updated_at"] = updatedAt
		}
		
		if deletedAt != nil {
			json["deleted_at"] = deletedAt
		}
		
		if billingAddress != nil {
			json["billing_address"] = billingAddress
		}
		
		if customer != nil {
			json["customer"] = customer
		}
		
		return json
	}
}
