//
//  ConectionAPI.swift
//  Mobint
//
//  Created by Daniel Griso Filho on 1/27/16.
//  Copyright © 2016 Daniel Griso Filho. All rights reserved.
//

import Foundation


class ConectionAPI {
    
    func loadShots(completion: ((AnyObject) -> Void)!){
        
        let urlString = "https://trakt.tv/pin/8033/shows/:slug"
        
        let session = NSURLSession.sharedSession()
        
        let shotURL = NSURL(string: urlString)
        
        let task = session.dataTaskWithURL(shotURL!){
            (data,response,error) -> Void in
           
            if error != nil {
                
                print(error?.localizedDescription)
                
            }else{
                
                let ShowData = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as? NSArray                
                
                var show = [Show]()
                for shows in ShowData!{
                
                    let shows = Show(data: shows as! NSDictionary)
                    show.append(shows)
                    
                }
                
                let priority =  DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)){
                    dispatch_async(dispatch_get_main_queue()){
                        completion(show)
                    }
                }
            }
        }
        task.resume()
    }
}