//
//  Room.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//Base Struct for Rooms as stored on the Database
struct Room:Codable{
    var roomNumber: Int?
    var batchName: String?
    var instructorName: String?
    var status: Status?
    var location: Location?
    var id: String?
}

struct roomStatus: Codable{
    var statusCode: Int
    var description: String
    var allcampus: [campusJSON]
    var allrooms: [roomJSON]
}

struct campusJSON: Codable{
    var id: String
    var campus: String
}

struct roomJSON: Codable{
    var id: String
    var room: String
    var capacity: Int
    var batch_name: String
    var trainer_name: String
    var status: Int
}
