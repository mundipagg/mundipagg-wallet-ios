//
//  APIRequestManager.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 31/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation


class WalletRequestManager: NSObject {
	let urlSession = URLSession(configuration: URLSessionConfiguration.ephemeral)
	var request: URLRequest
	
	init(withURL url: URL, httpMethod: WalletHTTPMethod ) {
		request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = httpMethod.rawValue
	}
	
	func requestDidFinish(_ data: Data, response: HTTPURLResponse) {
		preconditionFailure("Method not implemented")
	}
	
	func performCallback(_ error: NSError?) {
		preconditionFailure("Method not implemented")
	}
	
	func requestPrepare() { }
	
	func begin() {
		requestPrepare()
		let task = urlSession.dataTask(with: request, completionHandler : requestCompletionHandler)
		task.resume()
	}
	
	func setAccessToken(_ accessToken: String) {
		request.setValue("Basic " + accessToken, forHTTPHeaderField: "Authorization")
	}
	
	private func requestCompletionHandler(_ data: Data?, response: URLResponse?, error: Error?) {
		guard let response = response as? HTTPURLResponse, let data = data, error == nil else {
			if let error = error {
				Logger.logError(error as NSError)
			}
			self.performCallback(error as NSError?)
			return
		}
		
		Logger.logResponse(response, data: data)
		
		//If the status code isn't 2XX
		if response.statusCode / 100 != 2 {
			self.performCallback(WalletError.errorForResponse(response, data: data))
		} else {
			requestDidFinish(data, response: response)
		}
	}
}


/**
Represents HTTP methods that could be used.
*/
public enum WalletHTTPMethod: String {
	/// `GET` graph request HTTP method.
	case GET = "GET"
	/// `POST` graph request HTTP method.
	case POST = "POST"
	/// `DELETE` graph request HTTP method.
	case DELETE = "DELETE"
}
