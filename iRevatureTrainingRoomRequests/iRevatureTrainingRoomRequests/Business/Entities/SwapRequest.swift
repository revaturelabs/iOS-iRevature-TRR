//
//  SwapRequest.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct SwapRequest:Codable {
    var requestId: Int
    var firstRoomNumber: Int
    var secondRoomNumber: Int
    var requestorName: String
    var comments: String
    var startDate: Date
    var endDate: Date
}
