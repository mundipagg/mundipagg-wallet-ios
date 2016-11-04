//
//  WalletConfiguration.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 31/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation



public class WalletConfiguration: NSObject {

	/**
	Singleton object representing the default configuration
	*/
	public static var sharedConfiguration = WalletConfiguration()
	
	public var gatewayPublicKey: String?
	
	
	public var ApiURL = URL(string: WalletAPIClient.kDefaultApiURL)! {
		didSet {
			
			ApiURL = ApiURL.absoluteString.withoutTrailingSlash.asURL ?? ApiURL
		}
	}
	
	public override init() {
		super.init()
		
	}
	
}
