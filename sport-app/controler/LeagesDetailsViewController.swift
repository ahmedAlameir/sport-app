//
//  LeagesDetailsViewController.swift
//  sport-app
//
//  Created by ahmed osama on 3/1/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import UIKit
import Kingfisher
class LeagesDetailsViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    
    @IBOutlet weak var UoComingCollectionView: UICollectionView!
    @IBOutlet weak var EventReasultCollection: UICollectionView!
    @IBOutlet weak var teamCollictionView: UICollectionView!
    var leageName = String()
    var leageID = String()
    var upComingEvent = [UpComingEvent]()
    var latestEvent = [Latestevent]()
    var teams = [Team]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "UpcomingCollectionViewCell", bundle: nil)
        self.UoComingCollectionView.register(nib, forCellWithReuseIdentifier: "upcoming")
        let nib1 = UINib(nibName: "LatestCollectionViewCell", bundle: nil)
        self.EventReasultCollection.register(nib1, forCellWithReuseIdentifier: "ResultsEvent")
        let nib2 = UINib(nibName: "UpcomingCollectionViewCell", bundle: nil)
        self.teamCollictionView.register(nib2, forCellWithReuseIdentifier: "upcoming")
        
        
        SportController.shared.getUpComing(leageName: leageName) {  result in
            switch result
            {
            case .success(let upcoming):
                DispatchQueue.main.async {
                    self.upComingEvent=upcoming
                    self.UoComingCollectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        SportController.shared.getLastest(leageid: leageID)  {  result in
                       switch result
                       {
                       case .success(let latestEvent):
                           DispatchQueue.main.async {
                               self.latestEvent=latestEvent
                               self.EventReasultCollection.reloadData()
                           }
                       case .failure(let error):
                           print(error)
                       }
        }
        SportController.shared.getTeams(leageName: leageName) {  result in
                       switch result
                       {
                       case .success(let teams):
                        guard let teams = teams else {
                            return
                        }
                           DispatchQueue.main.async {
                              self.teams=teams
                               self.teamCollictionView.reloadData()
                           }
                       case .failure(let error):
                           print(error)
                       }
        }
        


        // Do any additional setup after loading the view.
    
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case UoComingCollectionView:
            let x = upComingEvent.count
            return upComingEvent.count
        case EventReasultCollection:
            return latestEvent.count
        default:
            return teams.count
        }
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case  UoComingCollectionView:
            let cell = UoComingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcoming", for: indexPath) as! UpcomingCollectionViewCell
        
             let url = URL(string: upComingEvent[indexPath.row].strThumb)
          //  print(url)
           // cell.hg.text="jmjjgjg"
            cell.image.kf.setImage(with: url)
            return cell
        case EventReasultCollection :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultsEvent", for: indexPath) as! LatestCollectionViewCell
            cell.LastestImage.kf.setImage(with: URL(string:  latestEvent[indexPath.count].strThumb))
            cell.homeTeam.text = latestEvent[indexPath.row].intHomeScore
            cell.awayTeam.text = latestEvent[indexPath.row].intAwayScore
            print(latestEvent[indexPath.count].strThumb)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcoming", for: indexPath) as! UpcomingCollectionViewCell
            cell.image.kf.setImage(with: teams[indexPath.row].strTeamBadge)
                    return cell
            
        }
       
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case UoComingCollectionView:
            
            return CGSize(width: UIScreen.main.bounds.width/1.1, height: 160)
        case EventReasultCollection:
            return CGSize(width: UIScreen.main.bounds.width/1.1, height: 160)
        default:
            return CGSize(width: UIScreen.main.bounds.width/1.1, height: 160)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamCollictionView{
            let view = storyboard?.instantiateViewController(identifier: "teamDetail") as! TeamDeitailViewController
            view.team = teams[indexPath.row]
            self.present(view, animated: true, completion: nil)}
        
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
