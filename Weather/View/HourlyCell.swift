//
//  HourlyCell.swift
//  Weather
//
//  Created by 소범석 on 2023/02/22.
//

import UIKit

class HourlyCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "HourlyCell"
    
    var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: <#T##[UIView]#>)
        
        return sv
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    // MARK: - API
    
    // MARK: - Helpers
}
