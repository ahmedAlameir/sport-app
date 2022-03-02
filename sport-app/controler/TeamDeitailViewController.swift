//
//  TeamDeitailViewController.swift
//  sport-app
//
//  Created by ahmed osama on 3/2/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import UIKit

class TeamDeitailViewController: UIViewController {
    var team = Team()

    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamBadg: UIImageView!
    @IBOutlet var teamStadName: UILabel!
    @IBOutlet var teamStad: UIImageView!
    @IBOutlet var teamJersey: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamName.text = team.strTeam
        teamBadg.kf.setImage(with: team.strTeamBadge)
        teamStadName.text = team.strStadium
        teamStad.kf.setImage(with: team.strStadiumThumb)
        teamJersey.kf.setImage(with: team.strTeamJersey)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
