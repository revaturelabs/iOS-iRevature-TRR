//
//  RoomQuery.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/21/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import SQLite

let db = try! Connection(getDBFilePath(dbName: "iRevatureTrainingRoomRequests"))
let rooms = Table("Room")
let roomNumber = Expression<Int?>("RoomNumber")
let batchName = Expression<String?>("BatchName")
let instructorName = Expression<String?>("InstructorName")
let status = Expression<String?>("Status")
let location = Expression<Int?>("Location")

func romByNumber(number: Int) -> Room?{
    var result: [Room] = []
    do{
        let temp = rooms.filter(roomNumber == number)
        for room in try! db.prepare(temp) {
            let temp2 = Room.init(roomNumber: room[roomNumber]!, batchName: room[batchName]!, instructorName: room[instructorName]!, status: Status.statusType(assign: room[status]!)!, location: locationByID(ID: room[location]!)!)
            result.append(temp2)
        }
        return result[0]
    }
}

func selectAllRooms() -> [Room]{
    
    var temp: Room
    //var recordCount = users.count
    
    var result: [Room] = []
    print(getDBFilePath(dbName:"iRevatureTrainingRoomRequests"))
    
    for room in try! db.prepare(rooms) {
        temp = Room.init(roomNumber: room[roomNumber]!, batchName: room[batchName]!, instructorName: room[instructorName]!, status: Status.statusType(assign: room[status]!)!, location: locationByID(ID: room[location]!)!)
        
        result.append(temp)
    }
    return result
}
