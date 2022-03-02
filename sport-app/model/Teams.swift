//
//  Teams.swift
//  sport-app
//
//  Created by ahmed osama on 3/2/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import Foundation
//struct Teams: Codable {
//    let teams: [[String: String?]]
//}
struct Team:Codable {
    var idTeam: String?
    var strTeam: String?
    
    var strStadium: String?
    var strStadiumThumb: URL?
    
    var strWebsite: String?
    var strFacebook: String?
    var strTwitter: String?
    var strInstagram: String?
    var strDescriptionEN: String?
    
    var strTeamBadge: URL?
    var strTeamLogo: URL?

    var strTeamJersey: URL?
    var strTeamBanner: URL?
    
}
