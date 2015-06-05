//
//  gps.swift
//  SimpleCTA
//
//  Created by paul hawk on 5/30/15.
//  Copyright (c) 2015 Depaul University. All rights reserved.
//

import Foundation

class UserGps: NSObject {

    let latitude : Double?  // need to make enums
    let longitude : Double?
    
    var manager: OneShotLocationManager?
    
    override init(){
        self.latitude = 41.89632184
        self.longitude = -87.75410482
        manager = OneShotLocationManager()
        }
    
    
    func getUserLocation() -> [String:Double]? {
        
        // closure runs immediately
        manager?.fetchWithCompletion {location, error in
            if let loc = location{
                println(loc)
            } else if let err = error {
                println(err.localizedDescription)
            }
            // release the manager
            self.manager = nil
        }

        
        if let lat = self.latitude, long = self.longitude {
            return ["latitude" : lat,  "longitude" : long]
        } else {
            return nil
        }
        
    }
}