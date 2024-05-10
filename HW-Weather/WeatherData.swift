//
//  ModelWeather.swift
//  HW-Weather
//
//  Created by Pavel Dolgopolov on 10.05.2024.
//

import Foundation

struct WeatherData: Decodable {
    struct WeatherInfo: Decodable {
        let main: String
        let description: String
    }
    
    struct MainInfo: Decodable {
        let temp: Double
        let pressure: Int
        let humidity: Int
    }
    
    struct WindInfo: Decodable {
        let speed: Double
        let deg: Int
        let gust: Double
    }

    struct SysInfo: Decodable {
        let country: String
        let sunrise: Int
        let sunset: Int
    }
    
    let weather: [WeatherInfo]
    let base: String
    let main: MainInfo
    let wind: WindInfo
    let sys: SysInfo
    let name: String
}
