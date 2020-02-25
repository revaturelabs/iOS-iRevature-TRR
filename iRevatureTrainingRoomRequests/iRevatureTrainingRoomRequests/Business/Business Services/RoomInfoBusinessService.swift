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
                    try self.db.run(self.rooms.insert(or: .replace, self.roomNumber <- room.roomNumber, self.id <- room.id))
                } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
                    print("constraint failed: \(message), in \(String(describing: statement))")
                } catch let error {
                    print("insertion failed: \(error)")
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
                let tempRoom = Room(roomNumber: Int(room.room), id: room.id)
                roomsArray.append(tempRoom)
                //  print(self.roomsArray.count)
            }
            completionHandler(roomsArray)
        })
        
    }
}

