//
//  WalletError.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 31/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


let WalletErrorDomain = "WalletErrorDomain"


public class WalletError: NSError {

	static let InternalSDKError = WalletError(code: 0, description: "Internal SDK Error")

	static let APIResponseError = WalletError(code: 1, description: "Unrecognized API Response")
	
	class func errorForResponse(_ response: HTTPURLResponse, data: Data) -> WalletError {
		var description = ""
		if let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any], let errorDescription = json["message"] as? String {
			description = errorDescription
		} else if response.statusCode == 401 {
			description = "Unauthorized"
		} else {
			return WalletError.APIResponseError
		}
		return WalletError(code: response.statusCode, description: description)
	}
	
	/**
	Initializer for WalletError
	
	- parameters:
	- code: HTTP Error code for the error.
	- description: Localized description of the error.
	*/
	init(code: Int, description: String) {
		var userInfo = [String: Any]()
		userInfo[NSLocalizedDescriptionKey] = description
		
		super.init(domain: WalletErrorDomain, code: code, userInfo: userInfo)
		
		Logger.logError(self)
	}
	
	/// Not implemented, do not use.
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
