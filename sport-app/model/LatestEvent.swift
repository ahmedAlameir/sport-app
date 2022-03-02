//
//  LatestEvent.swift
//  sport-app
//
//  Created by ahmed osama on 3/2/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import Foundation
struct LatestEvents: Codable {
    let events: [Latestevent]
}
struct Latestevent:Codable {
    let strThumb: String
    let intHomeScore:String
    let intAwayScore: String
    
    
}
