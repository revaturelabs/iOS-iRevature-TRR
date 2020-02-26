//
//  Trainer.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/24/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//Structs for interacting with the Trainer API
struct trainerStatus: Codable{
    var statusCode: Int
    var descriptions: String
    var trainerArray: [trainerJSON]
}

struct trainerJSON: Codable{
    var id: String
    var name: String
    var emailaddress: String
    var primarylocation: String
    var profilepicture: String
    var skills: [String]
}
