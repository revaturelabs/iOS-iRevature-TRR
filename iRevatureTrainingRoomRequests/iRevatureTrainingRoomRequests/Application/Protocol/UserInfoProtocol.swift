//
//  Filename: UserInfoProtocol.swift
//  CiRevatureTrainingRoomRequests
//
//  Created by Udayakumar Mathivanan on 2/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation


protocol UserInfoProtocol {
    func getUserInfo() -> User?
    func setUserInfo(userObject: User) -> Bool
    func getUserInfoDB() ->User?
    func setUserInfoDB()
    func getTrainerAPI(completionHandler: @escaping ([User]) -> Void)
}

