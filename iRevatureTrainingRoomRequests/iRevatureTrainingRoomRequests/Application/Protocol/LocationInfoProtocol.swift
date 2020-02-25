//
//  LocationInfoProtocol.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

protocol LocationInfoProtocol{
    
    func setLocationInfoDB()
    
    func getLocationAPI() -> [Location]
}
