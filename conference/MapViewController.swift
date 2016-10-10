//
//  MapViewController.swift
//  conference
//
//  Created by Bharath Bandaru on 30/09/16.
//  Copyright © 2016 ux. All rights reserved.
//

import UIKit
import GoogleMaps
class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GMSServices.provideAPIKey("AIzaSyDqtW20XsBgN8t2zz8TVOEwcVsgGCUGv-g")
        let camera = GMSCameraPosition.camera(withLatitude: 17.442602, longitude: 78.381475, zoom: 16)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let currentloc = CLLocationCoordinate2DMake(17.442602, 78.381475)
        let marker = GMSMarker(position: currentloc)
        marker.title = "Westin, Raheja IT Park"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.icon = UIImage(named: "flag_icon")
        marker.map = mapView
        self.view = mapView
    }



}
