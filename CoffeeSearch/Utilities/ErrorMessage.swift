//
//  ErrorMessage.swift
//  CoffeeFollowers
//
//  Created by Laurent B on 03/03/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import Foundation

enum CFErrorMessage: String, Error {
    case invalidRequest = "Unable to complete request, check your internet connection"
    case invalidResponse = "Invalid response from the server"
    case invalidDataReceived = "The data received from the server was invalid"
    case invalidJSONField = "The data received from the server contained a field that did not match"
    case invalidJSONValueType = "The data received from the server contained a field that had an unexpected value type"
    
}
