//
//  ViewController.swift
//  Weather
//
//  Created by 소범석 on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    var weather: Weather?
    var main: Main?
    var name: String?
    var table: UITableView!
    var models = [Weather]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        table.delegate = self
        table.dataSource = self
        
        WeatherService().getWeather { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.weather = weatherResponse.weather.first
                    self.main = weatherResponse.main
                    self.name = weatherResponse.name
                }
            case .failure(let error):
                print("DEBUG: \(error)")
            }
        }
    }
    
    // MARK: - Selectors
    
    
    // MARK: - API

    
    // MARK: - Helpers
    private func setWeather() {
        
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
