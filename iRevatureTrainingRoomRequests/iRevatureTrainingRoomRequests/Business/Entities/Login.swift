//
//  Login.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/24/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//Login struct to be sent to the API
struct Login: Codable {
    var username: String
    var password: String
}
