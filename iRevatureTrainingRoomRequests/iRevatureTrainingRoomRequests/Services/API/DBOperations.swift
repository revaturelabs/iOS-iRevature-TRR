//
//  DBOperations.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/20/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//get the database file path
public func getDBFilePath(dbName:String) -> String
{
 
  var filePath:URL?
   
  if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
    filePath = dir.appendingPathComponent(dbName + ".db")
     
    return filePath!.absoluteString
  }
   
  return ""
}
