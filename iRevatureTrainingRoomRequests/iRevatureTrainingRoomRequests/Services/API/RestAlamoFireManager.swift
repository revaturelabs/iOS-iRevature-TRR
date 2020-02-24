//
//  RestAlamoFileManager.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import Alamofire

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
    
    func postLogin(login: Login, completionHandler: @escaping (UserJSON) -> Void) {
        let login = Login(username: login.username, password: login.password)
        AF.request(
            "https://private-dbd7b7-security14.apiary-mock.com/security/login",
            method: .post,
            parameters: login,
            encoder: JSONParameterEncoder.default
        ).validate().responseDecodable(of: UserJSON.self){
            (response) in
            guard let user = response.value else {
                print("Error appeared")
                print(response.error?.errorDescription! ?? "Unknown error found")
                return
            }
            completionHandler(user)
        }
    }
}
