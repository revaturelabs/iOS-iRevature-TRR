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
}
