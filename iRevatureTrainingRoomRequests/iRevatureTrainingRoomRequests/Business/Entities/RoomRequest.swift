//
//  RoomRequest.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct RoomRequest:Codable{
    var requestId: Int
    var roomNumber: Int
    var requestorName: String
    var requestType: RequestType
    var comments: String
    var startDate: Date
    var endDate: Date
}
