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
	
	init(withURL url: URL, httpMethod: WalletHTTPMethod, payload: Data? ) {
		request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = httpMethod.rawValue
		
		if payload != nil{
			request.httpBody = payload
		}
	}
	
	func requestDidFinish(_ data: Data, response: HTTPURLResponse) {
		preconditionFailure("Method not implemented")
	}
	
	func performCallback(_ error: NSError?) {
		preconditionFailure("Method not implemented")
	}
	

	func sendRequest(response: @escaping (Dictionary<String, Any>?, NSError?) -> ()) {
		
		let session = URLSession.shared
		
		
		let task = session.dataTask(with: request) { (data, urlResponse, error) in
			
            if let error = error {
					
					Logger.logError(error as NSError)
					
					let errorCode = (error as NSError).code
					response(nil, WalletError(code: errorCode, description: error.localizedDescription))
					
            }
            else {
                if let data = data {
						
						
						
                    let httpUrlResponse = urlResponse as! HTTPURLResponse
                    switch httpUrlResponse.statusCode {
                        
                    case 200...299:
                        do {
                            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
									
									debugPrint(jsonDictionary)
									
									response(jsonDictionary, nil)
                        }
                        catch let error {
                            let caughtError = error as NSError
                            response(nil, WalletError(code: caughtError.code, description: caughtError.localizedDescription))
                        }
                        
                    default:
                        let walletError = WalletError.errorForResponse(httpUrlResponse, data: data)
                        response(nil, walletError)
                    }
                }
                else {
                    response(nil, WalletError.APIResponseError)
                }
            }
        }
        
        task.resume()
    }
    
	func setAccessToken(_ accessToken: String) {
		request.setValue("Basic " + accessToken, forHTTPHeaderField: "Authorization")
	}
	
	//func prepareForRequest() {}
	
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
 * Represents HTTP methods that could be used.
 */
public enum WalletHTTPMethod: String {
	/// `GET` graph request HTTP method.
	case GET = "GET"
	/// `POST` graph request HTTP method.
	case POST = "POST"
	/// `DELETE` graph request HTTP method.
	case DELETE = "DELETE"
}
