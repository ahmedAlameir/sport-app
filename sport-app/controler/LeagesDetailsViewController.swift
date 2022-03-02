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

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "UpcomingCollectionViewCell", bundle: nil)
        self.UoComingCollectionView.register(nib, forCellWithReuseIdentifier: "upcoming")
        
        
        
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
            return upComingEvent.count
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultsEvent", for: indexPath)
            print(latestEvent[indexPath.count].strThumb)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath)
                    return cell
            
        }
       
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case UoComingCollectionView:
            
            return CGSize(width: UIScreen.main.bounds.width/0.9, height: 150)
        case EventReasultCollection:
            return CGSize(width: UIScreen.main.bounds.width/0.9, height: 150)
        default:
            return CGSize(width: UIScreen.main.bounds.width/0.9, height: 150)
        }
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
