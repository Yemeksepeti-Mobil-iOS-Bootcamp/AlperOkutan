//
//  MapViewController.swift
//  OnboardWithPageControl
//
//  Created by alper okutan on 10.07.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func showUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServies() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            /*
            mapView.showsUserLocation = true
            showUserLocation()
            locationManager.startUpdatingLocation()
            */
        //Pinleme sonrası
        trackingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways:
            break
        case .restricted:
            break
        }
    }
    
    func trackingLocation() {
        mapView.showsUserLocation = true
        showUserLocation()
        locationManager.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
                
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    //Pinlemeden önce kullandık
    /*
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
     }
     */
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder()
        
        guard let lastLocation = lastLocation else { return }
        
        guard center.distance(from: lastLocation) > 30 else { return }
        self.lastLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            let city = placemark.locality ?? "City"
            let street = placemark.thoroughfare ?? "Street"
            let countryCode = placemark.isoCountryCode ?? "CountryCode"
            let subThoroughfare = placemark.subThoroughfare ?? "subStreet"
            let postalCode = placemark.postalCode ?? "Postal Code"
            let administrativeArea = placemark.administrativeArea ?? ""
            let subLocality = placemark.subLocality ?? ""
                        
            self.addressLabel.text = "\(countryCode), \(administrativeArea), \(postalCode) - \(city), \(subLocality) - \(street), No: \(subThoroughfare)"
           
        }
    }
}
