//
//  LeagesDetailsViewController.swift
//  sport-app
//
//  Created by ahmed osama on 3/1/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import UIKit

class LeagesDetailsViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
   
    
    @IBOutlet weak var UoComingCollectionView: UICollectionView!
    @IBOutlet weak var EventReasultCollection: UICollectionView!
    @IBOutlet weak var teamCollictionView: UICollectionView!
    var leageName = String()
    var leageID = String()
    var upComingEvent = [UpComingEvent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(leageName)
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


        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case UoComingCollectionView:
            return upComingEvent.count
        case EventReasultCollection:
            return upComingEvent.count
        default:
            return upComingEvent.count
        }
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case  UoComingCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingEvent", for: indexPath) as! UpComingCollectionViewCell
            cell.upComingImige.kf.setImage(with: URL(string: upComingEvent[indexPath.row].strThumb))
            return cell
        case EventReasultCollection :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultsEvent", for: indexPath)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath)
                    return cell
            
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
