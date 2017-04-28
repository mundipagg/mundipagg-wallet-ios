//
//  Wallet.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 25/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


public final class Wallet {
	private init() {}
	/// Singleton representing the primary Wallet instance using the default configuration.
	public static let sharedInstance = Wallet()
	
	///Access token to auth with Mundipagg api
	var currentAccessToken: AccessToken = AccessToken(authorizationToken: "")
}
