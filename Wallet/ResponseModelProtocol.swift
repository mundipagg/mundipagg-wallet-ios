//
//  ResponseModelProtocol.swift
//  Wallet
//
//  Created by Breno Aboud on 24/01/17.
//  Copyright © 2017 Buy4. All rights reserved.
//

import Foundation

public typealias JSON = [String: Any]

protocol ModelResponseProtocol{
    
    func toJson() -> JSON
    init?(from json: JSON)
}
