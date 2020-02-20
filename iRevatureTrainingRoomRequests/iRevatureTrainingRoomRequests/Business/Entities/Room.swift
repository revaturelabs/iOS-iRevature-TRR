//
//  Room.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct Room:Codable{
    var roomNumber: Int
    var batchName: String
    var instructorName: String
    var status: Status
    var location: Location
}
