//
//  Extensions.swift
//  BberryApp
//
//  Created by Evgeniy Suprun on 08.05.2020.
//  Copyright © 2020 Evgeniy Suprun. All rights reserved.
//

import UIKit

extension UIButton {
    
  func setBackgroundColor(_ color: UIColor, forState controlState: UIControl.State) {
    let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { _ in
      color.setFill()
      UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
    }
    setBackgroundImage(colorImage, for: controlState)
  }
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension UICollectionViewCell{
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    class var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell{
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    class var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView{
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    class var identifier: String {
        return String(describing: self)
    }
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    func viewTapped() {
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.backgroundColor = .white
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
        
    }
    
    //MARK: - dropShadow UIView
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 20
    }
    
}

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

extension UIView {
    func addGradient() {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.colors = [
          UIColor(red: 0.988, green: 0.855, blue: 0.561, alpha: 1).cgColor,
          UIColor(red: 0.98, green: 0.741, blue: 0.094, alpha: 1).cgColor
        ]
        layer.locations = [0, 1]
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 0.94, ty: 0))
        layer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
        layer.position = self.center
        layer.cornerRadius = CGFloat(frame.height / 2)
        
        layer.addSublayer(layer)
    }
}



extension String {
    func widthWithConstrainedHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }

}
