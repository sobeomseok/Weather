//
//  SeparateLineView.swift
//  Weather
//
//  Created by 소범석 on 2023/02/22.
//

import UIKit

class SeparateLineView: UIView {

  // MARK: - Initializers
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 0.5449205637, green: 0.5544300675, blue: 0.6000839472, alpha: 1)
  }
  
  // MARK: - Layout Methods
  internal func makeConstraints(atBottom bottom: NSLayoutYAxisAnchor) {
      
  }
}
