//
//  AccessToken.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 01/11/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


//--------------------------------------
// MARK: - Access Token
//--------------------------------------

/**
Represents an immutable access token used to authenticate with Facebook services.
*/
public struct AccessToken {

	/// An opaque authentication token.
	public let authorizationToken: String
	
	/// The expirate date for the token.
	public let expirationDate: Date

	
	public init(authorizationToken: String,
	            expirationDate: Date = Date.distantFuture) {
		
		
		self.authorizationToken = authorizationToken
		self.expirationDate = expirationDate
	}
}

//--------------------------------------
// MARK: - Current Token
//--------------------------------------

extension AccessToken {
	private static var _accessToken: AccessToken?
	
	public static var current: AccessToken? {
		get {
			
			if(_accessToken == nil){
				_accessToken = AccessToken.init(authorizationToken: "Bearer undefined", expirationDate: Date.distantFuture)
				return _accessToken
			}else{
				return _accessToken
			}
			
		}
		
		set{
			_accessToken = newValue
		}
	}
}

