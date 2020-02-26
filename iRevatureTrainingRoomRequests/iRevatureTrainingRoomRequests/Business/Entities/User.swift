//
//  User.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//Base Struct for Users as stored on the Database
struct User: Codable {
    var name: String
    var role: String?
    var email: String
    var token: String?
    var keepmelogged: Bool?
}

//Structure for holding the Login JSON Response
struct UserJSON: Codable {
  let primaryLocation: String
  let statusCode: Int
  let description: String
  let loginToken: String
  let currentSystemRole:CurrentSystemRole
}
//Structure for holding the child sub-type of User structure above
struct CurrentSystemRole: Codable {
  let id: Int
  let code: String
  let description: String
  let name: String
}
