/*
 UserInfoBusinessService.swift
 AppName: iRevatureTrainingRoomRequests
 Class Name: UserInfoBusinessService
 Created by : Udayakumar Mathivanan on 2/17/20.
 Modified by: Udayakumar Mathivanan on 2/17/20.
 Copyright © 2020 revature. All rights reserved.
 Description: Business service to handle user info which is available in UserDefaults
 */

import Foundation
import SQLite

//MARK: Business service to handle user info which is available in UserDefaults

class UserInfoBusinessService : UserInfoProtocol
{
    
    //read the user object from the userdefault data store
    func getUserInfo() -> User? {
        let currentUserDefaults = UserDefaults.standard
        //  let decoded  = currentUserDefaults.object(forKey: "UserSharedInfo") as! Data
        if let decodeduserInfo = (currentUserDefaults.value(forKey: "UserSharedInfo"))
        {
            let decodedUser = try? PropertyListDecoder().decode(User.self, from: decodeduserInfo as! Data)
            return decodedUser
        }
        else
        {
            return nil
        }
    }
    
    //write the user object to the userdefault data store
    func setUserInfo(userObject: User) -> Bool {
        let currentUserDefaults = UserDefaults.standard
        if((try? currentUserDefaults.set(PropertyListEncoder().encode(userObject), forKey: "UserSharedInfo")) != nil){
            return true}
        else {
            return false
        }
    }
    
    func getUserInfoDB() ->User? {
        let userQuery = UserQuery()
        let users = userQuery.selectAllUsers()
        return users[0]
    }
    
    let db = try! Connection(getDBFilePath(dbName: "iRevatureTrainingRoomRequests"))
    let users = Table("User")
    let name = Expression<String?>("Name")
    let role = Expression<String?>("Role")
    let email = Expression<String?>("Email")
    let token = Expression<String?>("Token")
    let keepMeLogged = Expression<Int?>("KeepMeLogged")
    
    func setUserInfoDB(){
        let trainers = getTrainerAPI()
        for trainer in trainers {
            do {try db.run(users.insert(or: .replace, name <- trainer.name, role <- "Trainer", email <- trainer.email, token <- trainer.token, keepMeLogged <- 0))
            } catch {
            }
        }
    }
    
    func getTrainerAPI() -> [User] {
        let trainerAPI = RestAlamoFireManager()
        var users:[User] = []
        _ = trainerAPI.getTrainers(completionHandler: {trainers in
            for trainer in trainers {
                let trainer = User(name: trainer.name, role: "Trainer", email: trainer.emailaddress, token: "", keepmelogged: false)
                users.append(trainer)
            }
        })
        return users
    }
}
