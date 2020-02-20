//
//  RequestsProtocol.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

protocol RequestsInfoProtocol{
    
    func getRequestsInfo() -> RoomRequest?
    func setRequestsInfo(RequestObject:RoomRequest) -> Bool?

}

