//
//  SportController.swift
//  sport-app
//
//  Created by ahmed osama on 3/1/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import Foundation
class SportController  {
    static let shared = SportController()
    
    func getSport(complation:@escaping(Result<[Sport],Error>)->Void){
        let sportUrl = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
        guard let url = sportUrl else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, _, erorr) in
            guard let data = data else{
                return
        }
            do{
                let result = try JSONDecoder().decode(Sports.self, from: data)
                complation(.success(result.sports))
            }catch{
                print("all sport erorr")
            }
        
    }
        task.resume()
}
    func getleages(sportName:String, complation:@escaping(Result<[League],Error>)->Void){
            let leagesUrl = URL(string: "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(sportName)")
            guard let url = leagesUrl else {
                return
            }
       // print(url)
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, _, erorr) in
                guard let data = data else{
                    return
            }
                do{
                    let result = try JSONDecoder().decode(Leagues.self, from: data)
                    complation(.success(result.countrys))
                }catch{
                    print("all leages erorr")
                }
            
        }
            task.resume()
    }
    func getUpComing(leageName:String, complation:@escaping(Result<[UpComingEvent],Error>)->Void){
        let urlString="https://www.thesportsdb.com/api/v1/json/2/searchfilename.php?e=\(leageName.replacingOccurrences(of: " ", with: "%20"))"
        let leagesUrl = URL(string: urlString)
            guard let url = leagesUrl else {
                return
            }
        print(url)
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, _, erorr) in
                guard let data = data else{
                    return
            }
                do{
                    let result = try JSONDecoder().decode(UpComingEvents.self, from: data)
                    complation(.success(result.event))
                }catch{
                    print("Up Coming erorr")
                }
            
        }
            task.resume()
    }
    func getLastest(leageid:String, complation:@escaping(Result<[Latestevent],Error>)->Void){
        let urlString="https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=\(leageid)"
        let leagesUrl = URL(string: urlString)
            guard let url = leagesUrl else {
                return
            }
        print(url)
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, _, erorr) in
                guard let data = data else{
                    return
            }
                do{
                    let result = try JSONDecoder().decode(LatestEvents.self, from: data)
                    complation(.success(result.events))
                    
                }catch{
                    print("latest erorr")
                }
            
        }
            task.resume()
    }
}
