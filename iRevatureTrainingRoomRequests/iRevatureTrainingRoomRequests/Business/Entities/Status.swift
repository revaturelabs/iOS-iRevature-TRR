//
//  Status.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

enum Status{
    case pending
    case assigned
    case unassigned
}


extension Status: Codable {
    
    enum Key: CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .pending
        case 1:
            self = .assigned
        case 2:
            self = .unassigned
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .pending:
            try container.encode(0, forKey: .rawValue)
        case .assigned:
            try container.encode(1, forKey: .rawValue)
        case .unassigned:
            try container.encode(2, forKey: .rawValue)
        }
    }
    
    static func statusType(assign: String) -> Status?{
        switch assign{
        case "pending":
            return .pending
        case "assigned":
            return .assigned
        case "unassigned":
            return  .unassigned
        default:
            print("invalid status")
            return nil
        }
    }
}
