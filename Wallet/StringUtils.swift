//
//  String.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 31/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


internal extension String {
	var withLeadingSlash: String {
		if hasPrefix("/") {
			return self
		} else {
			return "/" + self
		}
	}
	
	var withoutTrailingSlash: String {
		if hasSuffix("/") {
			return substring(to: characters.index(endIndex, offsetBy: -1))
		} else {
			return self
		}
	}
	
	var asURL: URL? {
		return URL(string: self)
	}
}

internal extension String {
	var dateFromISO8601Format: Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		return dateFormatter.date(from: self)
	}
}
