//
//  RestAlamoFileManager.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class RestAlamoFireManager {
    let userQuery = UserQuery()
    
    func getRooms() -> [Room]?{
      return nil
    }
    
    func getTrainers() -> [User]{
        let users = userQuery.selectAllUsers()
        return users
    }
    
    func getLocations() -> [Location]?{
        return nil
    }
    
    func getRoomRequests() -> [RoomRequest]?{
        return nil
    }
    
    func getSwapRoomRequests() -> [SwapRequest]?{
        return nil
    }
    
    func postRoomRequest(roomRequest: RoomRequest){
 
    }
    
    func postSwapRequest(swapRequest: SwapRequest){
        
    }
    
    func postLogin(Username: String, Password: String) -> String? {
        return nil
    }
    
}
