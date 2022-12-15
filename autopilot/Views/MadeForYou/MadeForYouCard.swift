//
//  MadeForYouCard.swift
//  autopilot
//
//  Created by Matthew Molinar on 12/14/22.
//

import UIKit

class MadeForYouCard: UIView {
  // The gradient layer that will be animated
  let gradientLayer = CAGradientLayer()

  // The path that defines the shape of the gradient layer
  let path = UIBezierPath()

  // The start and end points of the gradient animation
  let startPoint = CGPoint(x: 0, y: 0)
    let endPoint = CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height)

  override init(frame: CGRect) {
    super.init(frame: frame)

    // Set up the gradient layer
    gradientLayer.frame = bounds
    gradientLayer.startPoint = startPoint
    gradientLayer.endPoint = endPoint
    gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]

    // Set up the shape layer that will clip the gradient layer
    let shapeLayer = CAShapeLayer()
    shapeLayer.frame = bounds
    shapeLayer.path = path.cgPath
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.black.cgColor
    gradientLayer.mask = shapeLayer

    // Add the gradient layer to the view
    layer.addSublayer(gradientLayer)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func animateGradient() {
    // Create the basic animation
    let animation = CABasicAnimation(keyPath: "startPoint")
    animation.fromValue = startPoint
    animation.toValue = endPoint
    animation.duration = 2
    animation.timingFunction = CAMediaTimingFunction(name: .linear)

    // Add the animation to the gradient layer
    gradientLayer.add(animation, forKey: "gradientAnimation")
  }
}


