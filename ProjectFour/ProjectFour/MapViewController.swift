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


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
//    class farmerMarket:NSObject, MKAnnotation {
//        
//        let title:String?
//        let locationName:String
//        let discipline: String
//        let coordinate:CLLocationCoordinate2D
//        
//        init(title:String, locationName:String, discipline:String, coordinate:CLLocationCoordinate2D) {
//            
//            self.title = title
//            self.locationName = locationName
//            self.discipline = discipline
//            self.coordinate = coordinate
//        }
//        
//        var subtitle:String? {
//            
//            return locationName
//        }
//    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    func checkLocationAuthorizationStatus () {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            mapView.showsUserLocation = true
            
        } else {
            
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationAuthorizationStatus()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(manager:CLLocationManager, didChangeAuthorizationStatus status:CLAuthorizationStatus) {
        
        switch status {
            
        case .notDetermined: print ("Not Determined")
            
        case .restricted: print ("Restricted")
            
        case .denied: print ("Denied")
            
        case .authorizedAlways: print ("Authorized Always")
            
        case .authorizedWhenInUse: print ("Authorized When in Use")
        
        locationManager.startUpdatingLocation()
        }
    }
    
    
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
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
