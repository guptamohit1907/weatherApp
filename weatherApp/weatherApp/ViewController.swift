//
//  ViewController.swift
//  weatherApp
//
//  Created by Mohit Gupta on 19/08/22.

import UIKit
import WeatherKit
import CoreLocation

final class ViewController: UIViewController, CLLocationManagerDelegate {
    let loctionManager = CLLocationManager()
    let service = WeatherService()
    let weatherView = WeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIView()
        getUserLocation()
        
    }
    private func getUserLocation(){
        loctionManager.requestWhenInUseAuthorization()
        loctionManager.delegate = self
        loctionManager.startUpdatingLocation()
    }
    
    private func getWeather(location : CLLocation){
        Task {
            do {
               let result = try await service.weather(for: location)
                print("Current : " + String(describing: result.currentWeather))
                print("Daily : " + String(describing: result.dailyForecast))
                print("Minutely : " + String(describing: result.minuteForecast))
                weatherView.configure(with : .result.currentWeather)
            }
            catch{
                print(String(describing: error))
            }
        }
    }
    
    private func setupUIView(){
        view.addSubview(weatherView)
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        locationManager.stopUpdatingLocation()
        getWeather(location: location)
    }
    
   
}

