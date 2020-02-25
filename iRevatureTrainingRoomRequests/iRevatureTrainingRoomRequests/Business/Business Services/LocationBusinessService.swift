//
//  LocationBusinessService.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import SQLite

class LocationBusinessService: LocationInfoProtocol{
    let db = try! Connection(getDBFilePath(dbName: "iRevatureTrainingRoomRequests"))
     let locations = Table("Location")
     var building = Expression<String>("Building")
     var campus = Expression<String>("Campus")
     var state = Expression<String>("State")
     var locationID = Expression<Int>("LocationID")
     var id = Expression<String?>("ID")
     
     func setLocationInfoDB(){
         let locationsArray = getLocationAPI()
         for location in locationsArray {
            do {try db.run(locations.insert(or: .replace, id <- location.ID, state <- location.State!, campus <- location.Campus!, building <- location.Building!))
             } catch {
             }
         }
     }
     
     func getLocationAPI() -> [Location] {
         let locationAPI = RestAlamoFireManager()
         var locationsArray:[Location] = []
         _ = locationAPI.getLocations(completionHandler: {locationsResults in
             for location in locationsResults {
                let newLocation = Location(id: location.id, state: location.state, campus: location.campus, building: location.building)
                 locationsArray.append(newLocation)
             }
         })
         return []
     }
    
}
