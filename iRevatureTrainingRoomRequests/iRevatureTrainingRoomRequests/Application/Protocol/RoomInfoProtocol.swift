//
//  RoomInfoProtocol.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

protocol RoomInfoProtocol{
    
    func setRoomInfoDB()
    
    func getRoomAPI() -> [Room] 
}
