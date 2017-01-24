//
//  DeleteCardResponse.swift
//  Wallet
//
//  Created by Breno Aboud on 23/01/17.
//  Copyright © 2017 Buy4. All rights reserved.
//

import Foundation

public class DeleteCardResponse : NSObject, NSCoding {
    
    public var id: String
    public var gatewayId: String
    public var last_four_digits: String
    public var brand: String
    public var holder_name: String
    public var status: String
    public var created_at: Date
    public var updated_at: Date
    public var deleted_at: Date
    public var customerAddress: Address!
    public var customer: Customer
    
    
    required public init?(coder aDecoder: NSCoder) {
        <#code#>
    }
    
    public func encode(with aCoder: NSCoder) {
        <#code#>
    }
}
