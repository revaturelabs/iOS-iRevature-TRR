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
import SQLite3
import os.log

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
            os_log("Userdefaults obtained",log: OSLog.default, type: .info)
            return decodedUser
        }
        else
        {
            os_log("failed to get Userdefaults",log: OSLog.default, type: .info)
            return nil
        }
    }
    
    //write the user object to the userdefault data store
    func setUserInfo(userObject: User) -> Bool {
        let currentUserDefaults = UserDefaults.standard
        if((try? currentUserDefaults.set(PropertyListEncoder().encode(userObject), forKey: "UserSharedInfo")) != nil){
            os_log("Set userdefaults",log: OSLog.default, type: .info)
            return true
        }
        else {
            os_log("Failed to set userdefaults",log: OSLog.default, type: .info)
            return false
        }
    }
    
//potentially need but unused at the moment
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
    
    //Creates/Updates the info in the user table in database
    func setUserInfoDB(){
        _ = getTrainerAPI(completionHandler: {
            allTrainers in
            for trainer in allTrainers {
                do {
                    try self.db.run(self.users.insert(or: .replace, self.name <- trainer.name, self.role <- trainer.role, self.email <- trainer.email))
                } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
                    print("constraint failed: \(message), in \(String(describing: statement))")
                    os_log("Constraint failed",log: OSLog.default, type: .info)
                } catch let error {
                    os_log("Insertion failed",log: OSLog.default, type: .info)
                    print("insertion failed: \(error)")
                }
            }
        })
    }
    
    //gets the API and passes the info to the setUserInfoDB 
    func getTrainerAPI(completionHandler: @escaping ([User]) -> Void) {
        let trainerAPI = RestAlamoFireManager()
        _ = trainerAPI.getTrainers(completionHandler: {
            trainersReturned in
            var trainerArray:[User] = []
            for trainer in trainersReturned {
                print("trainer \(trainer.id) \(trainer.emailaddress)")
                let tempTrainer = User(name: trainer.name, role: "Trainer", email: trainer.emailaddress)
                trainerArray.append(tempTrainer)
                //  print(self.roomsArray.count)
            }
            completionHandler(trainerArray)
        })
    }
}
