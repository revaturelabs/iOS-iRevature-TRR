//
//  LocationQuery.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/21/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import SQLite

let database = try! Connection(getDBFilePath(dbName: "iRevatureTrainingRoomRequests"))
let locations = Table("Location")
let locationID = Expression<Int?>("LocationID")
let state = Expression<String?>("State")
let campus = Expression<String?>("Campus")
let building = Expression<String?>("Building")
let id = Expression<String?>("ID")

func locationByID(ID: Int) -> Location?{
    return nil
}

func selectAllLocations() -> [Location]?{
    var temp: Location
    //var recordCount = users.count

    var result: [Location] = []
    print(getDBFilePath(dbName:"iRevatureTrainingRoomRequests"))
    
    for location in try! db.prepare(locations) {
        temp = Location.init(Building: location[building]!, Campus: location[campus]!, State: location[state]!, LocationID: location[locationID]!, ID: location[id]!)

        result.append(temp)
    }
    return result
}
