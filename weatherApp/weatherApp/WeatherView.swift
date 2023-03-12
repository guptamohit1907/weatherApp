//
//  WeatherView.swift
//  weatherApp
//
//  Created by Mohit Gupta on 12/03/23.
//

import UIKit
import WeatherKit

final class WeatherView : UIView {
    private let iconView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        return image
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight : .medium)
        return label
    }()
    
    private let tempLabel : UILabel = {
        let label = UILabel()
        label.text = "37"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 55, weight : .regular)
        return label
    }()
    
    override init(frame : CGRect){
        super.init(frame : frame)
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints  = false
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(tempLabel)
        addConstraints()
    }
    
    required init?(coder : NSCoder){
        fatalError()
    }
    
    func configure(with currentWeather: CurrentWeather) {
          titleLabel.text = currentWeather.symbolName
//          stateLabel.text = currentWeather.weather.first?.state ?? "Unknown"
//        titleLabel.text = currentWeather.climate.tempStringInFahrenheit(.average)
//        tempLabel.text = "High " + currentWeather.climate.tempStringInFahrenheit(.high)
//          lowTemperatureLabel.text = "Low " + currentWeather.climate.tempStringInFahrenheit(.low)
      }
}
