//
//  SwapRequestInfoProtocol.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

protocol SwapRequestsProtocol {

    func getSwapRequestsInfo() -> SwapRequest?
    func setSwapRequestsInfo(RequestObject:SwapRequest) -> Bool
}
