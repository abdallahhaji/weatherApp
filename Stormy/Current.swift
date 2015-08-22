//
//  Current.swift
//  Stormy
//
//  Created by Abdallah Haji on 2015-05-31.
//  Copyright (c) 2015 Abdallah Haji. All rights reserved.
//

import Foundation

import UIKit

struct Current {

    var currentTime: String?
    var temperature: Int?
    var humidity: Double
    var precipProbability: Double
    var summary: String
    var icon: UIImage?

    init(weatherDictionary: NSDictionary) {
    
        let currentWeather = weatherDictionary["currently"] as NSDictionary
  
        
        
        
        humidity = currentWeather["humidity"] as Double
        precipProbability = currentWeather["precipProbability"] as Double
        summary = currentWeather["summary"] as String
        
        let farheneitTemp = currentWeather["temperature"] as Int
        temperature = convertTemperatureFromFarheneitToCelcius(farheneitTemp)
        
        let currentTimeIntValue = currentWeather["time"] as Int
        currentTime = dateStringFromUnixtime(currentTimeIntValue)
        
        let iconString = currentWeather["icon"] as String
        icon = weatherIconFromString(iconString)
        
    }
    
    
    
    func convertTemperatureFromFarheneitToCelcius(farheneitTemp: Int) -> Int {
    
        let temperatureInCelcius = (farheneitTemp - 32) * 5 / 9
    
        return temperatureInCelcius
    
    
    }
    
    
    
    
    
    func dateStringFromUnixtime(unixTime: Int) -> String {
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        
        let timeInSeconds = NSTimeInterval(unixTime)
    
        let weatherDate = NSDate(timeIntervalSince1970: timeInSeconds)
       
       return dateFormatter.stringFromDate(weatherDate)
        
        
    }
    
    
    
    
    
    func weatherIconFromString(stringIcon: String) -> UIImage {
    
        var imageName: String
        
        switch stringIcon {
        
        case "clear-day":
                imageName = "clear-day"
        case "clear-night":
            imageName = "clear-night"
        case "rain":
            imageName = "rain"
        case "snow":
            imageName = "snow"
        case "sleet":
            imageName = "sleet"
        case "wind":
            imageName = "wind"
        case "fog":
            imageName = "fog"
        case "cloudy":
            imageName = "cloudy"
        case "partly-cloudy-day":
            imageName = "partly-cloudy"
        case "partly-cloudy-night":
            imageName = "cloudy-night"
        default:
            imageName = "default"
        
        }
    
       var iconImage = UIImage(named: imageName)
        return iconImage!
        
    }

}






