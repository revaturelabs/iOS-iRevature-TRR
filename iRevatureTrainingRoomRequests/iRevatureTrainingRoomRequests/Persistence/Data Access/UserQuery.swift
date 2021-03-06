//
//  Query.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/20/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import SQLite
import os.log


//Responsible for all queries to the local database relating to the user
class UserQuery{
    let db = try! Connection(getDBFilePath(dbName: "iRevatureTrainingRoomRequests"))
    let users = Table("User")
    let name = Expression<String?>("Name")
    let role = Expression<String?>("Role")
    let email = Expression<String?>("Email")
    let token = Expression<String?>("Token")
    let keepMeLogged = Expression<Int?>("KeepMeLogged")
    
    //Finds all users stored in the local database
    func selectAllUsers() -> [User]{
    
        var temp: User
        //Finds user specified by their specific UserID
        func userByID(ID: Int) -> User?{
            var result: [User] = []
            do{
            let temp = users.filter(locationID == ID)
            for user in try! db.prepare(temp) {
                let temp2 = User.init(name: user[name]!, role: user[role]!, email: user[email]!, token: user[token]!, keepmelogged: false)
                result.append(temp2)
                
                }
            os_log("User is queried",log: OSLog.default, type: .info)
            return result[0]
            }
        }
    
        var result: [User] = []
        print(getDBFilePath(dbName:"iRevatureTrainingRoomRequests"))
        
        for user in try! db.prepare(users) {
            print("name: \(user[name]!), role: \(user[role]!), email: \(user[email]!), token \(user[token]!), keepMeLogged \(user[keepMeLogged]!)")
            if user[keepMeLogged]! == 0 {
                temp = User.init(name: user[name]!, role: user[role]!, email: user[email]!, token: user[token]!, keepmelogged: false)
            } else{
                temp = User.init(name: user[name]!, role: user[role]!, email: user[email]!, token: user[token]!, keepmelogged: true)
            }
            result.append(temp)
        }
        os_log("All users queried",log: OSLog.default, type: .info)
        return result
    }
}
