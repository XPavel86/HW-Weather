//
//  main.swift
//  HW-Weather
//
//  Created by Pavel Dolgopolov on 10.05.2024.
//

import Foundation

let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Moscow&APPID=4f7dd0216b1e869d2a717e512544f020"

guard let url = URL(string: urlString) else {
    print("Incorrect URL")
    exit(1)
}

let semaphore = DispatchSemaphore(value: 0)

URLSession.shared.dataTask(with: url) { data, _, error in
    defer { semaphore.signal() }
    guard let data = data else {
        print(error?.localizedDescription ?? "No Error description")
        return
    }
    let decoder = JSONDecoder()
    do {
        let weatherData = try decoder.decode(WeatherData.self, from: data)
        print(weatherData)
    } catch {
        print(error.localizedDescription)
    }
}.resume()

semaphore.wait()
