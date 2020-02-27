//
//  DBOperations.swift
//  iRevatureTrainingRoomRequests
//
//  Created by admin on 2/20/20.
//  Copyright © 2020 revature. All rights reserved.
//
import Foundation

//get the database file path
let docName = "iRevatureTrainingRoomRequests"
   let docExt = "db"
   
//Copy the db file into document directory from bundle
func copyFileToDocumentsFolder(nameForFile: String, extForFile: String) {
  let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
  let destURL = documentsURL!.appendingPathComponent(nameForFile).appendingPathExtension(extForFile)
  guard let sourceURL = Bundle.main.url(forResource: nameForFile, withExtension: extForFile)
    else {
      print("Source File not found.")
      return
  }
    let fileManager = FileManager.default
    do {
      try fileManager.copyItem(at: sourceURL, to: destURL)
    } catch {
      print("Unable to copy file")
    }
}
//verify whether SQLite DB already exists in Documents Directory flder
func verifyIfSqliteDBExists() ->Bool{
  let docsDir   : URL    = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
  let dbPath   : URL    = docsDir.appendingPathComponent("iRevatureTrainingRoomRequests.db")
  let available:Bool = false
  do{
    let available : Bool = try dbPath.checkResourceIsReachable()
    print("An sqlite database exists at this path :: \(dbPath.path)")
    return available
  }catch{
    print("SQLite NOT Found")
  }
   
  return available
}
   
public func getDBFilePath(dbName:String) -> String
{
   
  if(verifyIfSqliteDBExists() == false)
  {
    copyFileToDocumentsFolder(nameForFile: docName, extForFile: docExt)
  }
  
   var filePath:URL?
   if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
   filePath = dir.appendingPathComponent(dbName + ".db")
   
   return filePath!.absoluteString
   }
   
//  if let dir = Bundle.main.path(forResource: dbName, ofType: "db")
//  {
//
//    return dir
//
//  }
   
   
   
   
  return ""
}
















Message #project2-ios-feb2020-usf-nec


Downloads


