//
//  RestAlamoFileManager.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import Alamofire
import os.log

class RestAlamoFireManager {
    
    
    var userInfo:UserInfoBusinessService = UserInfoBusinessService()
    
    let parameters = [
    "type": "training"
    ]
    
    func getRooms(completionHandler: @escaping ([roomJSON]) -> Void) {
    
        let headers: HTTPHeaders = [
            "Authorization": "Bearer" + userInfo.getUserInfo()!.token!,
        "Accept": "application/json"
    ]
    
        
        AF.request(
               "https://private-dbd7b7-security14.apiary-mock.com/coredata/room",
               method: .get,
               parameters: parameters,
               encoder: URLEncodedFormParameterEncoder.default,
               headers: headers
        ).validate().responseDecodable(of: roomStatus.self){(response) in
            os_log("Made it rooms with additional",log: OSLog.default, type: .info)
            guard let room = response.value else{
                print("Error appeared \(String(describing: response.error))")
                os_log("Error",log: OSLog.default, type: .info)
             //   print(response.error?.errorDescription! ?? "Unknown error found")
                return
            }
            completionHandler(room.allrooms)
        }
    }
    
    func getTrainers(completionHandler: @escaping ([trainerJSON]) -> Void) {
     
        let headers: HTTPHeaders = [
            "Authorization": "Bearer" + userInfo.getUserInfo()!.token!,
             "Accept": "application/json"
         ]
        
        
        AF.request(
               "https://private-dbd7b7-security14.apiary-mock.com/coredata/trainers",
               method: .get,
               parameters: parameters,
               encoder: URLEncodedFormParameterEncoder.default,
               headers: headers
        ).validate().responseDecodable(of: trainerStatus.self){(response) in
            //   print("Made it trainers")
            guard let trainer = response.value else{
              //  print("Error appeared")
                //print(response.error?.errorDescription! ?? "Unknown error found")
                return
            }
            completionHandler(trainer.trainerArray)
        }
    }
    
    func getLocations(completionHandler: @escaping ([locationJSON]) -> Void) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer" + userInfo.getUserInfo()!.token!,
             "Accept": "application/json"
         ]
        
        AF.request(
               "https://private-dbd7b7-security14.apiary-mock.com/coredata/location",
               method: .get,
               parameters: parameters,
               encoder: URLEncodedFormParameterEncoder.default,
               headers: headers
        ).validate().responseDecodable(of: locationStatus.self){(response) in
            os_log("Made it locations",log: OSLog.default, type: .info)
            guard let location = response.value else{
                print("Error appeared \(String(describing: response.error))")
                print(response.error?.errorDescription! ?? "Unknown error found")
                os_log("Error",log: OSLog.default, type: .info)
                return
            }
            completionHandler(location.alllocation)
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
                os_log("Error appeared",log: OSLog.default, type: .info)
                print(response.error?.errorDescription! ?? "Unknown error found")
                return
            }
            completionHandler(user)
        }
    }
}
