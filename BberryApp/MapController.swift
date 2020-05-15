//
//  MapController.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 29.04.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController {
    
    let locationManager = CLLocationManager()
    let regionInMeters = 1000.00


    var mapView: MKMapView = {
        let map = MKMapView()
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    var adressInformation: UILabel = {
        let adressLabel = UILabel()
        adressLabel.text = "Выберите точку самовывоза"
        adressLabel.textColor = .black
        adressLabel.textAlignment = .center
        adressLabel.font = UIFont(name: "Roboto-Regular", size: 20)
        adressLabel.adjustsFontSizeToFitWidth = true
        adressLabel.minimumScaleFactor = 0.5
        adressLabel.translatesAutoresizingMaskIntoConstraints = false
        return adressLabel
    }()

    var zoomView: UIView = {
        let zoom = UIView()
        zoom.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        zoom.layer.cornerRadius = 20
        zoom.translatesAutoresizingMaskIntoConstraints = false
        return zoom
    }()
    
    var plusButton: UIButton = {
        let plus = UIButton()
        plus.setBackgroundImage(#imageLiteral(resourceName: "plus"), for: .normal)
        plus.contentMode = .scaleAspectFill
        plus.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        plus.translatesAutoresizingMaskIntoConstraints = false
        return plus
    }()
    
    var minusButton: UIButton = {
        let minus = UIButton()
        minus.setBackgroundImage(#imageLiteral(resourceName: "minus"), for: .normal)
        minus.contentMode = .scaleAspectFill
        minus.translatesAutoresizingMaskIntoConstraints = false
        minus.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return minus
    }()
    
    var centerButton: UIButton = {
        let centerBT = UIButton()
        centerBT.setBackgroundImage(#imageLiteral(resourceName: "bluecenter"), for: .normal)
        centerBT.setBackgroundImage(#imageLiteral(resourceName: "yellowcenter"), for: .highlighted)
        centerBT.contentMode = .scaleAspectFill
        centerBT.translatesAutoresizingMaskIntoConstraints = false
        centerBT.addTarget(self, action: #selector(centerbuttonTapped), for: .touchUpInside)
        return centerBT
    }()
    
    var bottomButtom: UIButton = {
        let bottomBT = UIButton()
        bottomBT.setTitle("Уточните адрес", for: .normal)
        bottomBT.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        bottomBT.titleLabel?.textAlignment = .center
        bottomBT.titleLabel?.adjustsFontSizeToFitWidth = true
        bottomBT.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        bottomBT.backgroundColor?.withAlphaComponent(0.1)
        bottomBT.setTitleColor(#colorLiteral(red: 0.9803921569, green: 0.7411764706, blue: 0.09019607843, alpha: 1), for: .highlighted)
        bottomBT.addTarget(self, action: #selector(bottomBTButtontapped), for: .touchUpInside)
        bottomBT.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.8509803922, blue: 0.9960784314, alpha: 1)
        bottomBT.layer.cornerRadius = 20
        bottomBT.translatesAutoresizingMaskIntoConstraints = false
        return bottomBT
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addInSubwies()
        mapViewConstraints()
        zoomViewConstraints()
        plusButtonConstraints()
        minusButtonConstraints()
        centerButtonConstraints()
        bottomButtonConstraints()
        adressLabelConstraints()
        setupPlacemark()
        mapView.delegate = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           mapView.removeFromSuperview()
       }

    
    func addInSubwies() {
        view.addSubview(mapView)
        view.addSubview(zoomView)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(centerButton)
        view.addSubview(bottomButtom)
        view.addSubview(adressInformation)
    }
    
    private func mapViewConstraints() {
        mapView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        mapView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    }
    
    private func adressLabelConstraints() {
        adressInformation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        adressInformation.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30).isActive = true
    }
    
    func zoomViewConstraints() {
        zoomView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        zoomView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        zoomView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        zoomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func plusButtonConstraints() {
        plusButton.heightAnchor.constraint(equalTo: zoomView.widthAnchor, multiplier: 1/2.5).isActive = true
        plusButton.widthAnchor.constraint(equalTo: zoomView.widthAnchor, multiplier: 1/2.5).isActive = true
        plusButton.centerXAnchor.constraint(equalTo: zoomView.centerXAnchor).isActive = true
        plusButton.topAnchor.constraint(equalTo: zoomView.topAnchor, constant: 15).isActive = true
        }
    
    func minusButtonConstraints() {
        minusButton.heightAnchor.constraint(equalTo: zoomView.widthAnchor, multiplier: 1/2.5).isActive = true
        minusButton.widthAnchor.constraint(equalTo: zoomView.widthAnchor, multiplier: 1/2.5).isActive = true
        minusButton.centerXAnchor.constraint(equalTo: zoomView.centerXAnchor).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: zoomView.bottomAnchor, constant: -15).isActive = true
    }
    
    func centerButtonConstraints() {
        centerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        centerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        centerButton.bottomAnchor.constraint(equalTo: bottomButtom.topAnchor, constant: -40).isActive = true
    }
    
    func bottomButtonConstraints() {
        bottomButtom.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.5).isActive = true
        bottomButtom.heightAnchor.constraint(equalToConstant: 45).isActive = true
        bottomButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomButtom.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    // MAP Navigation
    
    private func setupPlacemark() {
        
//        guard let location = place.location else { return }
//
        let location = ["Россия, Москва, Студённый проезд 32 корпус 1", "Россия, Московская область, Мытищи, Рождественская улица, 3","Россия, Москва, Ясный проезд, 13с2", "Россия, г Москва, Ясный проезд, 11А", "Россия, Московская область, Мытищи, Коммунистическая улица, 1"]
        
        
        let stringlocation = location.first
        guard let stringloc = stringlocation else { return }
 
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(stringloc) { (placemarks, error) in
            
            if error != nil {
                print(error?.localizedDescription ?? "Error")
                return
            }
            
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first
            
            let anotation = MKPointAnnotation()
            anotation.title = "Maгазин за домом"
            
            guard let placemarkLocation = placemark?.location else { return }
            
            anotation.coordinate = placemarkLocation.coordinate
            
            self.mapView.showAnnotations([anotation], animated: true)
            self.mapView.selectAnnotation(anotation, animated: true)
            
        }
    }
    
    // MARK: check user location enabled
    
    private func checkLocationManager() {
        
        if CLLocationManager.locationServicesEnabled() {
            setupLocetionManager()
            checkLocationAutorization()
        } else {
            showAlert(title: "Служба геолокации недоступна", message: "Для решения данной проблемы перейдите Настройки -> Конфициальность -> Службы геолокации")
        }
    }
    
    private func setupLocetionManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAutorization() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show alert controller
            showAlert(title: "Использование геопозиции ограничено", message: "Для решения данной проблемы отключите в настройках ограничения")
            break
        case .denied:
            showAlert(title: "Ваша геопозиция не включена", message: "Для решения данной проблемы перейдите Настройки -> Bberry -> Геопозиция")
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        @unknown default:
            print("New case has available")
        }
    }
    
    func zoom(_ zoomin : Bool) {
        var region = mapView.region
        var span = MKCoordinateSpan()
        span.latitudeDelta = zoomin ? region.span.latitudeDelta / 2 :  region.span.latitudeDelta * 2
        span.longitudeDelta = zoomin ? region.span.longitudeDelta / 2 : region.span.longitudeDelta * 2
        region.span = span

        mapView.setRegion(region, animated: true);
    }
    
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    
    @objc func plusButtonTapped() {
        self.zoom(true)
    }
    
    @objc func minusButtonTapped() {
        self.zoom(false)
    }
    
    @objc func centerbuttonTapped() {
       checkLocationManager()
       
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
        
    }
    
    @objc func bottomBTButtontapped() {
        let goodsVC = GoodsController()
        navigationController?.pushViewController(goodsVC, animated: true)
    }
}

extension MapController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else { return nil }

        let annotationIdentifier = "AnnotationIdentifier"

        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView = av
        }

        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "magazin")
        }

        return annotationView
    }
}

extension MapController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAutorization()
    }
    
}

extension MapController {
    
    public func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
