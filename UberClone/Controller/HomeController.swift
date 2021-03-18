//
//  HomeController.swift
//  UberClone
//
//  Created by andy on 14.03.2021.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {

    // MARK: - Properties

    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()

    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        checkUserIsLoggedIn()
        enableLocationServices()
    }

    // MARK: - API

    func checkUserIsLoggedIn() {
        if let uid = Auth.auth().currentUser?.uid {
            configureUI()
            debug("User login", uid)
        } else {
            debug("User is not logged in")
            presentLoginController()
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("SingOut error: \(error.localizedDescription)")
        }
    }

    // MARK: - Helper functions

    func configureUI() {
        configureMapView()
    }

    func configureMapView() {
        view.addSubview(mapView)
        mapView.frame = view.frame

        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }

    func presentLoginController() {
        let nav = UINavigationController(rootViewController: LoginController())
        if #available(iOS 13.0, *) {
            nav.isModalInPresentation = true
        }
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false, completion: nil)
    }

}

// MARK: - LocationServices

extension HomeController: CLLocationManagerDelegate {
    func enableLocationServices() {
        locationManager.delegate = self

        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            debug("Not Determined")
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways:
            debug("Authorized Always")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            debug("Authorized When In Use")
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
