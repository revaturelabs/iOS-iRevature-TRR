//
//  RoomQuery.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/21/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import SQLite
import os.log

let db = try! Connection(getDBFilePath(dbName: "iRevatureTrainingRoomRequests"))
let rooms = Table("Room")
let roomNumber = Expression<Int?>("RoomNumber")
let batchName = Expression<String?>("BatchName")
let instructorName = Expression<String?>("InstructorName")
let status = Expression<String?>("Status")
let location = Expression<Int?>("LocationID")

func roomByNumber(number: Int) -> Room?{
    var result: [Room] = []
    do{
        print(roomNumber)
        print(number)
        let temp = rooms.filter(roomNumber == number)
        for room in try! db.prepare(temp) {
            let temp2 = Room.init(roomNumber: room[roomNumber]!, batchName: room[batchName] ?? "", instructorName: room[instructorName] ?? "", status: Status.statusType(assign: room[status]!) ?? Status.unassigned, location: locationByID(ID: room[location] ?? -1))
            result.append(temp2)
        }
    }
    os_log("Room is queried")
        return result[0]
}

func selectAllRooms() -> [Room]{
    
    var temp: Room
    //var recordCount = users.count
    
    var result: [Room] = []
    print(getDBFilePath(dbName:"iRevatureTrainingRoomRequests"))
    
    for room in try! db.prepare(rooms) {
        temp = Room.init(roomNumber: room[roomNumber]!, batchName: room[batchName] ?? "", instructorName: room[instructorName] ?? "", status: Status.statusType(assign: room[status]!) ?? Status.unassigned, location: locationByID(ID: room[location] ?? -1))
        
        result.append(temp)
    }
    os_log("All rooms queried")
    return result
}
