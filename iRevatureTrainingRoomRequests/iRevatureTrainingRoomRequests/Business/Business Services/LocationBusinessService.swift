//
//  LocationBusinessService.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import SQLite
import SQLite3
import os.log

class LocationBusinessService: LocationInfoProtocol{
    let db = try! Connection(getDBFilePath(dbName: "iRevatureTrainingRoomRequests"))
    let locations = Table("Location")
    var building = Expression<String>("Building")
    var campus = Expression<String>("Campus")
    var state = Expression<String>("State")
    var locationID = Expression<Int>("LocationID")
    var id = Expression<String?>("ID")
    
    func setLocationInfoDB(){
        _ = getLocationAPI(completionHandler: {
            allLocations in
            for location in allLocations {
                do {
                    try self.db.run(self.locations.insert(or: .replace, self.building <- location.Building!, self.campus <- location.Campus!, self.state <- location.State!, self.id <- location.ID))
                } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
                    print("constraint failed: \(message), in \(String(describing: statement))")
                    os_log("Constraint failed")
                } catch let error {
                    print("insertion failed: \(error)")
                    os_log("Insertion failed")
                }
            }
        })
    }
    
    func getLocationAPI(completionHandler: @escaping ([Location]) -> Void) {
        let locationAPI = RestAlamoFireManager()
        _ = locationAPI.getLocations(completionHandler: {
            locationsReturned in
            var locationArray:[Location] = []
            for location in locationsReturned {
                print("location \(location.building) \(location.campus)")
                let tempLocation = Location(Building: location.building, Campus: location.campus, State: location.state, ID: location.id)
                locationArray.append(tempLocation)
                //  print(self.roomsArray.count)
            }
            completionHandler(locationArray)
        })
    }
}
