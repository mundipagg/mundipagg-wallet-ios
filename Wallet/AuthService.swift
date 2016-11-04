//
//  AuthService.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 31/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


typealias AccessTokenCallback = (_ accessToken: String?, _ error: NSError?) -> Void

final class AuthService: NSObject {
	
	
	weak var wallet: Wallet!
	
	init(withWallet wallet: Wallet) {
		self.wallet = wallet
	}
	
	// TODO: Criar interface de autenticação

}
