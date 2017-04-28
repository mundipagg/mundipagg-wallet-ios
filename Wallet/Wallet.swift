//
//  Wallet.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 25/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


public final class Wallet: WalletAPIClient {
	
	/// Singleton representing the primary Wallet instance using the default configuration.
	public static let shared = Wallet()
	
	public static var currentAccessToken: AccessToken? {
		get {
			return self.currentAccessToken
		}
		set {
			self.currentAccessToken = newValue
		}
	}
	
	public override init() {
		super.init()
		print("Class has been initialised")
		
	}
	
	public func doSomething(){
		print("Yeah, it works")
	}
}
