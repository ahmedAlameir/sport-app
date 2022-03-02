//
//  UpComing.swift
//  sport-app
//
//  Created by ahmed osama on 3/1/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import Foundation
struct UpComingEvents: Codable {
    let event: [UpComingEvent]
}
struct UpComingEvent:Codable {
    let strThumb: String
    
}
