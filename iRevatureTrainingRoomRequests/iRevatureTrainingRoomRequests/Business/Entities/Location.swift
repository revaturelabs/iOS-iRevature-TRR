//
//  Campuses.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct Location:Codable{
    var Building: String?
    var Campus: String?
    var State: String?
    var LocationID: Int?
    var ID: String?
}

struct locationStatus: Codable{
    var statusCode: Int
    var descriptions: String
    var locationsArray: [locationJSON]
}

struct locationJSON: Codable{
    var id: String
    var state: String
    var campus: String
    var building: String
}
