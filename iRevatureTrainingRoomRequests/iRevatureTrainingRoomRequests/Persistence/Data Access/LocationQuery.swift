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
    var result: [Location] = []
    do{
    let temp = locations.filter(locationID == ID)
    for location in try! db.prepare(temp) {
        let temp2 = Location.init(Building: location[building]!, Campus: location[campus]!, State: location[state]!, LocationID: location[locationID]!, ID: location[id]!)
        result.append(temp2)}
    return result[0]
    }
}

func selectAllLocations() -> [Location]?{
    var temp: Location
    //var recordCount = users.count
    
    var result: [Location] = []
    print(getDBFilePath(dbName:"iRevatureTrainingRoomRequests"))
    
    for location in try! db.prepare(locations) {
        temp = Location.init(Building: location[building] ?? "Other", Campus: location[campus]!, State: location[state]!, LocationID: location[locationID]!, ID: location[id] ?? "0")
        result.append(temp)
    }
    return result
}
