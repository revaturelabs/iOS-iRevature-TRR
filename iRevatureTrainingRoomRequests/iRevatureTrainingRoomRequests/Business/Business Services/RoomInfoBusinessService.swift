//
//  RoomInfoBusinessService.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import SQLite

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
        let roomsArray = getRoomAPI()
        for room in roomsArray {
            do {try db.run(rooms.insert(or: .replace, roomNumber <- room.roomNumber, id <- room.id))
            } catch {
            }
        }
    }
    
    func getRoomAPI() -> [Room] {
        let roomAPI = RestAlamoFireManager()
        var roomsArray:[Room] = []
        _ = roomAPI.getRooms(completionHandler: {rooms in
            for room in rooms {
                let room = Room(roomNumber: Int(room.room), id: room.id)
                roomsArray.append(room)
            }
        })
        return roomsArray
    }
}
