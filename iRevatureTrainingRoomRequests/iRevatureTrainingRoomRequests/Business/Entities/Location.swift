//
//  Campuses.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//Base Struct for Locations as stored on the Database
struct Location:Codable{
    var Building: String?
    var Campus: String?
    var State: String?
    var LocationID: Int?
    var ID: String?
}

struct locationStatus: Codable{
    var statusCode: Int
    var description: String
    var alllocation: [locationJSON]
}

struct locationJSON: Codable{
    var id: String
    var state: String
    var campus: String
    var building: String
}
