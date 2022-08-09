//
//  MapViewController.swift
//  Navigation
//
//  Created by Тарас Андреев on 03.08.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class MapViewController: UIViewController {
    
    // LocationManager
    
    private lazy var locationManager = CLLocationManager()
    
    // Хранение координат
    
    private lazy var myCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    // Карта
    
    private lazy var mapView:MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = self
        return mapView
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.setTitle(" Удалить все метки ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(removeAllPins), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupSubviews()
        configureMap()
        createPin()
        checkUserLocationPermission()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func createPin() {
        createPin(title: "Custom Pin", coordinate: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423))
    }
    
    // Построение маршрута
    
    private func addRoute(sourceLocation: CLLocationCoordinate2D, destinationLocation:CLLocationCoordinate2D) {
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { [self] (responce, error) in
            guard let directionsResponce = responce else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            
            let route = directionsResponce.routes[0]
            self.mapView.removeOverlays(mapView.overlays)
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    
    // Настройка внешнего вида карты
    
    private func configureMap() {
        mapView.mapType = .standard
        addPinGesture()
    }
    
    private func setupSubviews() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
        
        view.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
    }

    // Проверка разрешения геолокации
    
    private func checkUserLocationPermission() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = 10
        locationManager.startUpdatingLocation()
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .denied, .restricted:
            print("Измените настройки геолокации")
        default:
            print("Ошибка геолокации")
        }
    }
    
    // Создание пина на карте по координатам
    
    private func createPin(title: String, coordinate: CLLocationCoordinate2D) {
        let pin = MKPointAnnotation()
        pin.title = title
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }

    // Добавление пина на карту по длительному нажатию
    
    private func addPinGesture() {
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(tapOnMap(gestureRecognizer:)))
        longTap.minimumPressDuration = 1.2
        mapView.addGestureRecognizer(longTap)
    }
    
    // Добавить пин на карту
    
    @objc private func tapOnMap(gestureRecognizer: UILongPressGestureRecognizer) {
        
        let point = gestureRecognizer.location(in: mapView)
        let coordinates = mapView.convert(point, toCoordinateFrom: mapView)
        
        let newPinAlertTitle = "newPinAlert".localized(file: "LocalizationMap")
        let newPinAlertButton = "alertButton".localized(file: "LocalizationMap")
        
        let alertVC = UIAlertController(title: newPinAlertTitle, message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: newPinAlertButton, style: .default) { _ in
            guard let title = alertVC.textFields?.first?.text else { return }
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = "\(title)"
            self.mapView.addAnnotation(annotation)
        }
        alertVC.addTextField()
        alertVC.addAction(alertAction)
        self.present(alertVC, animated: true)
    }
    
    // Удалить все пины
    
    @objc private func removeAllPins() {
        self.mapView.removeAnnotations(mapView.annotations)
        self.mapView.removeOverlays(mapView.overlays)
    }
}

// MARK: - CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserLocationPermission()
    }
    
    // Метод, срабатывающий при обновлении геолокации более, чем на 20 метров
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        manager.distanceFilter = 20
        self.mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)
        self.myCoordinates = location.coordinate
    }
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {

    // Внешний вид маршрута
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .systemGreen
        renderer.lineWidth = 8
        return renderer
    }
    
    // Нажатие на пин (построение маршрута)
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let viewCoordinates = view.annotation?.coordinate else { return }
        addRoute(sourceLocation: self.myCoordinates, destinationLocation: viewCoordinates)
    }
}
