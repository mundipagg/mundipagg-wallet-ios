//
//  CardRequest.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 31/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation

class CardRequest: WalletRequestManager {
	
	//var callback: CardTypeCallback
	
	override init(withURL url: URL, httpMethod: WalletHTTPMethod) {
		//self.callback = callback
		super.init(withURL: url, httpMethod: httpMethod)
		setAccessToken((AccessToken.current?.authorizationToken)!)
	}
	
//	override func requestDidFinish(_ data: Data, response: HTTPURLResponse) {
//		guard let account = Card(fromJSON: data) else {
//			performCallback(WalletError.APIResponseError)
//			return
//		}
//		performCallback(account, error: nil)
//	}
	
//	override func performCallback(_ error: NSError?) {
//		performCallback(nil, error: error)
//	}
//	
//	func performCallback(_ account: Card?, error: NSError?) {
//		DispatchQueue.main.async {
//			self.callback(account, error)
//		}
//	}
}
