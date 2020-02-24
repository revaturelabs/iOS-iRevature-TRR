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
    func getRooms(completionHandler: @escaping ([roomJSON]) -> Void) {
        let currentUserDefaults = UserDefaults.standard
        AF.request(
               "",
               method: .get,
               parameters: currentUserDefaults.string(forKey: userInfo.getUserInfo()!.token),
               encoder: JSONParameterEncoder.default
        ).validate().responseDecodable(of: roomStatus.self){(response) in
            guard let room = response.value else{
                print("Error appeared")
                print(response.error?.errorDescription! ?? "Unknown error found")
                return
            }
            completionHandler(room.roomsArray)
        }
    }
    
    func getTrainers(completionHandler: @escaping ([trainerJSON]) -> Void) {
        let currentUserDefaults = UserDefaults.standard
        AF.request(
               "",
               method: .get,
               parameters: currentUserDefaults.string(forKey: userInfo.getUserInfo()!.token),
               encoder: JSONParameterEncoder.default
        ).validate().responseDecodable(of: trainerStatus.self){(response) in
            guard let trainer = response.value else{
                print("Error appeared")
                print(response.error?.errorDescription! ?? "Unknown error found")
                return
            }
            completionHandler(trainer.trainerArray)
        }
    }
    
    func getLocations(completionHandler: @escaping ([locationJSON]) -> Void) {
        let currentUserDefaults = UserDefaults.standard
        AF.request(
               "https://private-dbd7b7-security14.apiary-mock.com/coredata/location?type=training",
               method: .get,
               parameters: currentUserDefaults.string(forKey: userInfo.getUserInfo()!.token),
               encoder: JSONParameterEncoder.default
        ).validate().responseDecodable(of: locationStatus.self){(response) in
            guard let location = response.value else{
                print("Error appeared")
                print(response.error?.errorDescription! ?? "Unknown error found")
                return
            }
            completionHandler(location.locationsArray)
        }
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
