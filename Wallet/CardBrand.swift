//
//  CardBrand.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 26/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation

public enum CardBrand : String {
	
	public init(rawValue: String) {
		
		let brand = rawValue.lowercased()
		
		switch brand {
		case "visa":
			self = .visa
		case "mastercard":
			self = .mastercard
		case "discover":
			self = .discover
		case "elo":
			self = .elo
		case "ticket":
			self = .ticket
		case "alelo":
			self = .alelo
		case "amex":
			self = .amex
		case "aura":
			self = .aura
		case "diners":
			self = .dinersClub
		case "sodexo":
			self = .sodexo
		case "hipercard":
			self = .hipercard
		case "vr":
			self = .vr
		case "jcb":
			self = .jcb
		default:
			self = .unknown
		}
	}
	
	case visa = "visa"
	case mastercard = "mastercard"
	case amex = "amex"
	case elo = "elo"
	case discover = "discover"
	case aura = "aura"
	case dinersClub = "diners"
	case hipercard = "hipercard"
	case jcb = "jcb"
	case sodexo = "sodexo"
	case alelo = "alelo"
	case vr = "vr"
	case ticket = "ticket"
	case unknown = ""
}
