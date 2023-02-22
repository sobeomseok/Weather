//
//  WeatherService.swift
//  Weather
//
//  Created by 소범석 on 2023/02/22.
//

import Foundation

enum NetworkError: Error {
    case URLError
    case DataError
    case decodingError
}

class WeatherService {
    
    private var apiKey: String {
        guard let file = Bundle.main.path(forResource: "WeatherInfo", ofType: "plist") else { return "Couldn't find file 'WeatherInfo.plist'." }
        
        // .plist를 딕셔너리로 받아오기
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        // 딕셔너리에서 값 찾기
        guard let key = resource["OPENWEATHERMAP_KEY"] as? String else {
            fatalError("OPENWEATHERMAP_KEY error")
        }
        return key
    }
    
    func getWeather(completion: @escaping(Result<WeatherResponse, NetworkError>) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=\(apiKey)")
        
        guard let url = url else { return completion(.failure(.URLError)) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                   guard let data = data, error == nil else {
                       return completion(.failure(.DataError))
                   }
            
                   // Data 타입으로 받은 리턴을 디코드
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
                   // 성공
                   if let weatherResponse = weatherResponse {
                       print(weatherResponse)
                       completion(.success(weatherResponse)) // 성공한 데이터 저장
                   } else {
                       completion(.failure(.decodingError))
                       print("DEBUG: \(url)")
                   }
        }.resume()
    }
    
}
