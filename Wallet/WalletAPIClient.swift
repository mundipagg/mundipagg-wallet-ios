//
//  WalletAPIClient.swift
//  Wallet
//
//  Created by Jaime Costa Marques on 27/10/16.
//  Copyright © 2016 Buy4. All rights reserved.
//

import Foundation

public enum APIResources: String {
	case ListCreditCardOrCreate
    case DeleteCreditCard
}

open class WalletAPIClient: NSObject{
	
	// Default API Production URL
	static public let kDefaultApiURL = "api.mundipagg.com/core/v1"
	
	
	static private let kCustumersURL = "customers"
	
    
	//MARK: Header constants
	//static private let kAuthorizationValue = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ"
	
	
	private static var customerId: String? = nil
    private static var cardId : String = ""
	
	public static func getResourceURL(type: APIResources) -> URL{
		
		
		switch type {
		case .ListCreditCardOrCreate:
			return URL(string: "https://\(WalletConfiguration.sharedConfiguration.ApiURL)/\(WalletAPIClient.kCustumersURL)/\(WalletAPIClient.getCustomerId())/cards")!
            
        case .DeleteCreditCard:
            return URL(string: "https://\(WalletConfiguration.sharedConfiguration.ApiURL)/\(WalletAPIClient.kCustumersURL)/\(WalletAPIClient.getCustomerId())/cards/\(WalletAPIClient.getCardId())")!
        }
	}
	
	
	public static func setCustomerId(id: String?){
		self.customerId = id
	}
	
	public static func getCustomerId() -> String{
		return self.customerId!
	}
	
    public static func getCardId() -> String {
        return self.cardId
    }
    
    public static func setCardId(id: String) {
        self.cardId = id
    }
	
}
