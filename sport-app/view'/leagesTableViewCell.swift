//
//  leagesTableViewCell.swift
//  sport-app
//
//  Created by ahmed osama on 3/1/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import UIKit

class leagesTableViewCell: UITableViewCell {
    @IBOutlet weak var leagesBadge: UIImageView!
    @IBOutlet weak var leageName: UILabel!
    var link = String()
    var leageStr = String()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func youTupe(_ sender: Any) {
        let urlstr = "https://\(link)"
        guard let url = URL(string: urlstr)else{
            let youTupeUrl = "https://www.youtube.com/results?search_query=\(leageStr.replacingOccurrences(of: " ", with: ""))"
            UIApplication.shared.open(URL(string: youTupeUrl)!, options: [:], completionHandler: nil)
           return
        }
        UIApplication.shared.open( url, options: [:], completionHandler: nil)
    }
    
}
