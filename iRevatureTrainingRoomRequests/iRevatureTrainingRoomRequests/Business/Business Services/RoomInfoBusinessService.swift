//
//  RoomInfoBusinessService.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import SQLite
import SQLite3
import os.log

class RoomInfoBusinessService:RoomInfoProtocol{
    
    let db = try! Connection(getDBFilePath(dbName: "iRevatureTrainingRoomRequests"))
    let rooms = Table("Room")
    var roomNumber = Expression<Int?>("RoomNumber")
    var batchName = Expression<String?>("BatchName")
    var instructorName = Expression<String?>("InstructorName")
    var status = Expression<String?>("Status")
    var location = Expression<String?>("Location")
    var id = Expression<String?>("ID")
    
    func setRoomInfoDB(){
        _ = getRoomAPI(completionHandler: {
            allRooms in
            for room in allRooms {
                do {
                    try self.db.run(self.rooms.insert(or: .replace, self.roomNumber <- room.roomNumber, self.id <- room.id, self.batchName <- room.batchName, self.instructorName <- room.instructorName, self.status <- Status.stringFromStatus(assign: room.status!)))
                } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
                    print("constraint failed: \(message), in \(String(describing: statement))")
                    os_log("Constraint failed",log: OSLog.default, type: .info)
                } catch let error {
                    print("insertion failed: \(error)")
                    os_log("Insertion failed",log: OSLog.default, type: .info)
                }
            }
        })
    }
    
    func getRoomAPI(completionHandler: @escaping ([Room]) -> Void) {
        let roomAPI = RestAlamoFireManager()
        _ = roomAPI.getRooms(completionHandler: {
            roomsReturned in
            var roomsArray:[Room] = []
            for room in roomsReturned {
                print("room \(room.id) \(room.room)")
                let tempRoom = Room(roomNumber: Int(room.room), batchName: room.batch_name, instructorName: room.trainer_name, status: Status.statusTypeFromInt(assign: room.status), id: room.id)
                roomsArray.append(tempRoom)
                //  print(self.roomsArray.count)
            }
            completionHandler(roomsArray)
        })
        
    }
}

