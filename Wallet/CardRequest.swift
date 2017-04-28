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
	
	override init(withURL url: URL, httpMethod: WalletHTTPMethod, payload: Data?) {
		//self.callback = callback
		super.init(withURL: url, httpMethod: httpMethod, payload: payload)
		
		guard let accessToken = Wallet.currentAccessToken else {
			setAccessToken(AccessToken(authorizationToken: "").authorizationToken)
			return
		}
		
		setAccessToken(accessToken.authorizationToken)
	}
	
	
	/*override func prepareCreateCard() {
		self.request.httpBody = try? JSONSerialization.data(withJSONObject: postDictionary, options: [])
	}*/
	
	/*func setPayload(with data: Data){
		
		self.request.httpBody = data
		self.request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
	}*/
	
	
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
