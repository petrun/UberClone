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


    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        checkUserIsLoggedIn()
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
        view.addSubview(mapView)
        mapView.frame = view.frame
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
