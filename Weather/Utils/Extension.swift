//
//  Extension.swift
//  Weather
//
//  Created by 소범석 on 2023/02/22.
//

import UIKit

// MARK: - Int
extension Int {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

// MARK: - Double
extension Double {
    // 섭씨로 바꾸기
    func convertToCelsiusIntoString() -> String {
        let celsius = (self - 32) / 1.8
        let result = Int(celsius.rounded(.down))
        return String(result)
    }
    
    // 요일 가져오기 (현재 위치 날씨, 요일별 날씨에 필요)
    func getWeekDayToString() -> String? {
        let date = Date(timeIntervalSince1970: self)
        let calendar = Calendar.current
        if let day = calendar.dateComponents([.weekday], from: date).weekday {
            switch day {
            case 1:
                return "일요일"
            case 2:
                return "월요일"
            case 3:
                return "화요일"
            case 4:
                return "수요일"
            case 5:
                return "목요일"
            case 6:
                return "금요일"
            case 7:
                return "토요일"
            default:
                break
            }
        }
        return nil
    }
    
    // 시간 가져오기 (시간별 예보에 필요)
    func getHourToString(_ isSunData: Bool) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        if isSunData {
            dateFormatter.dateFormat = "a h:mm"
        }else {
            dateFormatter.dateFormat = "a h"
        }
        return dateFormatter.string(from: date)
    }
    
    // 소수점 %표시 바꾸기 (비 올 확률, 습도)
    func convertPercentageToStr() -> String {
        let result = Int((self * 100).rounded(.down))
        return String(result) + "%"
    }
    
    // 풍속 mile/hour -> m/s 로 바꾸기
    func convertWindFormatToStr() -> String {
        let meter = self * 1609.344
        let meterPerSecond = meter / 3600
        var result = -1 // 임시변수
        if meterPerSecond < 0 {
            return "error"
        } else if meterPerSecond < 1 {
            result = Int(meterPerSecond.rounded(.up))
        } else {
            result = Int(meterPerSecond.rounded(.up))
        }
        return String(result) + "m/s"
    }
    
    // 강수량 milimeter -> centimeter 로 바꾸기
    func convertMiliToCentiIntoStr() -> String {
        let result = Int((self * 10).rounded(.down))
        return String(result) + "cm"
    }
}

// MARK: - String
extension String {
    func convertToTimeInterval() -> TimeInterval {
        guard self != "" else {
            return 0
        }
        
        var interval:Double = 0
        
        let parts = self.components(separatedBy: ":")
        for (index, part) in parts.reversed().enumerated() {
            interval += (Double(part) ?? 0) * pow(Double(60), Double(index))
        }
        
        return interval
    }
}

// MARK: - Font
enum Font: String {
    case Regular = "myFont-Regular"
    case Bold = "myFont-Bold"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return Font.Regular.of(size: size)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return Font.Bold.of(size: size)
    }
}

//MARK: - 오토레이아웃 확장
extension UIView {
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var right: CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    /// 서브뷰 한 번에 추가하는 함수
    func addSubViews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    // Table Cell
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

// MARK: - TimeInterval format
extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60), Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}

//MARK: - UIStackView 확장
extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}

//MARK: - scrollView 확장
extension UIScrollView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
