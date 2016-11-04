//
//  MapViewController.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/27/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Async


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    //User Location
    
    var locationManager = CLLocationManager()
    
    func checkLocationAuthorizationStatus () {
        
        Async.background {
            
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                
                self.mapView.showsUserLocation = true
                
            } else {
                
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calling previous function. Setting properties of location manager
        
        checkLocationAuthorizationStatus()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    // Cases for location manager
    
    private func locationManager(manager:CLLocationManager, didChangeAuthorizationStatus status:CLAuthorizationStatus) {
        
        switch status {
            
        case .notDetermined: print ("Not Determined")
            
        case .restricted: print ("Restricted")
            
        case .denied: print ("Denied")
            
        case .authorizedAlways: print ("Authorized Always")
            
        case .authorizedWhenInUse: print ("Authorized When in Use")
        
        locationManager.startUpdatingLocation()
        }
    }
    
    // Centering map around user
    
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        
        let userLocation:CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        
        let longitude = userLocation.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.05
        
        let longDelta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location = CLLocationCoordinate2D(latitude:latitude, longitude:longitude)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.mapView.setRegion(region, animated:true)
    }
    
    //Map Annotations
    
    class farmerMarket:NSObject, MKAnnotation {
        
        let title:String?
        let locationName:String
        let discipline: String
        let coordinate:CLLocationCoordinate2D
        
        init(title:String, locationName:String, discipline:String, coordinate:CLLocationCoordinate2D) {
            
            self.title = title
            self.locationName = locationName
            self.discipline = discipline
            self.coordinate = coordinate
        }
        
        var subtitle:String? {
            
            return locationName
        }
    }
}


