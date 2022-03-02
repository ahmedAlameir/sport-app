//
//  leages.swift
//  sport-app
//
//  Created by ahmed osama on 3/1/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import Foundation
// MARK: - Leagues
struct Leagues: Codable {
    let countrys: [League]
}
struct League: Codable {
    let idLeague:String
    let strLeague:String
    let strYoutube:String
    let strBadge:String
    
}



