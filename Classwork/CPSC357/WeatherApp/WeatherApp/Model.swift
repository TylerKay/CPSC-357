//
//  Model.swift
//  WeatherApp
//
//  Created by Tyler Kay on 11/30/23.
//

import Foundation
//DATA
//Note: The name of the variables must match with the json file of the API call
struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
}
struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}
struct WeatherInfo: Codable {
    let main: String
    let description: String
}

