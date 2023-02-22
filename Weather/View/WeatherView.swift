//
//  WeatherView.swift
//  Weather
//
//  Created by 소범석 on 2023/02/22.
//

import UIKit

final class WeahterView: UIView {
    
    // MARK: - Properties
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "군산시"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .medium)
        return label
    }()
    
    private lazy var iconImageView: UIImageView  = {
        let imgView = UIImageView()
        
        return imgView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "-1"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 55, weight: .regular)
        return label
    }()
    
    private lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var minTempLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    // MARK: - API
    
    // MARK: - Helpers
    func addViews() {
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(cityLabel)
        addSubview(tempLabel)
        addSubview(descriptionLabel)
        addSubview(iconImageView)
        addSubview(maxTempLabel)
        addSubview(minTempLabel)
    }
    
    func configureUI() {
        
    }
    
    private func setWeatherUI() {
//        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
//        let data = try? Data(contentsOf: url!)
//        if let data = data {
//            iconImageView.image = UIImage(data: data)
//        }
//        tempLabel.text = "\(main!.temp)"
//        maxTempLabel.text = "\(main!.temp_max)"
//        minTempLabel.text = "\(main!.temp_min)"
    }
}
