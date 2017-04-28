//
//  Wallet.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 25/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


public final class Wallet {
	
	/// Singleton representing the primary Wallet instance using the default configuration.
	//public static var shared = self
	
	///Access token to auth with Mundipagg api
	public static var currentAccessToken: AccessToken?
	
	public static var sharedInstance: Wallet = Wallet()
	
	private init() {}
}
