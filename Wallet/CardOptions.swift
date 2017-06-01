//
//  CardOptions.swift
//  Wallet
//
//  Created by Breno Aboud on 01/06/17.
//  Copyright © 2017 Buy4. All rights reserved.
//

import Foundation

public struct CardOptions {
	
	fileprivate let verifyCard: Bool
	
	public var json: JSON {
		var json: JSON = [:]
		json["verify_card"] = verifyCard
		return json
	}
	
	public init(verifyCard: Bool) {
		self.verifyCard = verifyCard
	}
	
	public init?(json: JSON) {
		guard let verifyCard = json["verify_card"] as? Bool else { return nil }
		
		self.verifyCard = verifyCard
	}
}
