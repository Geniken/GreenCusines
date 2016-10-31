//
//  MapVariation.swift
//  ProjectFour
//
//  Created by Daniel Kim on 10/31/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation

//    let location = locations.first!
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 500, 500)
//        mapView.setRegion(coordinateRegion, animated: true)
//        locationManager.stopUpdatingLocation()

//        locationManager = nil
//    }
//
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        print("Failed to initialize GPS: ", error.description)

//
//        let userLocation: CLLocation = locations[0]
//
//        CLGeocoder().reverseGeocodeLocation(userLocation) {(placemarks, error) in
//
//            if error != nil {
//
//                print (error)
//
//            } else {
//
//                if let placemark = placemarks?[0] {
//
//                    var subThoroughfare = ""
//
//                    if placemark.subThoroughfare != nil {
//
//                        subThoroughfare = placemark.subThoroughfare!
//
//                    }
//
//                    var thoroughfare = ""
//
//                    if placemark.thoroughfare != nil {
//
//                        var thoroughfare = placemark.thoroughfare!
//                    }
//
//                    var subLocality = ""
//
//                    if placemark.subLocality != nil {
//
//                        var subLocality = placemark.subLocality!
//                    }
//                    var subAdministritiveArea = ""
//
//                    if placemark.subAdministrativeArea != nil {
//
//                        subAdministritiveArea = placemark.subAdministrativeArea!
//                    }
//
//                    var postalCode = ""
//
//                    if placemark.postalCode != nil {
//
//                        postalCode = placemark.postalCode!
//                    }
//
//                    var country = ""
//
//                    if placemark.country != nil {
//
//                        country = placemark.country!
//
//                    }
//
//                    print (subThoroughfare + thoroughfare + "\n" + subLocality + "\n" + subAdministritiveArea + "\n" + postalCode + "\n" + country)
//
//                }
//            }
//        }
//    }
