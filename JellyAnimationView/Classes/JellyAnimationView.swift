//
//  JellyAnimationView.swift
//  JellyAnimationView
//
//  Created by Koji Murata on 2017/09/21.
//

import UIKit

open class JellyAnimationView: UIView, CAAnimationDelegate {
  open func startAnimation() {
    if isAnimating { return }
    isAnimating = true
    immediately = false
    startVerticalAnimation()
  }
  
  open func stopAnimation(immediately: Bool = false) {
    isAnimating = false
    self.immediately = immediately
    if immediately {
      layer.removeAllAnimations()
    }
  }
  
  deinit {
    print("deiniiiiiiiiiiiiiiiiit")
  }
  
  @IBInspectable open var startWhenAwakeFromNib: Bool = true
  @IBInspectable open var duration: Double = 1
  @IBInspectable open var jumpHeight: CGFloat = 20
  @IBInspectable open var initialVelocity: CGFloat = 1
  
  open private(set) var isAnimating = false
  
  private var immediately = false
  
  private func startJellyWidthAnimation() {
    let animation = CASpringAnimation(keyPath: "transform.scale.x")
    animation.duration = 1
    animation.fromValue = 0.999
    animation.toValue = 1
    animation.mass = 1
    animation.initialVelocity = jumpHeight * 100 * initialVelocity
    animation.damping = 14
    animation.stiffness = 300
    animation.isRemovedOnCompletion = true
    layer.add(animation, forKey: nil)
  }
  
  private func startJellyHeightAnimation() {
    let animation = CASpringAnimation(keyPath: "transform.scale.y")
    animation.duration = 1
    animation.fromValue = 1.001
    animation.toValue = 1
    animation.mass = 1
    animation.initialVelocity = jumpHeight * 100 * initialVelocity
    animation.damping = 10
    animation.stiffness = 300
    animation.isRemovedOnCompletion = true
    layer.add(animation, forKey: nil)
  }
  
  private func startJellyAnimation() {
    startJellyWidthAnimation()
    startJellyHeightAnimation()
  }
  
  private func startVerticalAnimation() {
    let fps = 30
    let origin = center
    let valueNumber = Int(duration * CFTimeInterval(fps))
    let keyTimes = (0..<valueNumber).map { NSNumber(value: Double($0) / Double(valueNumber)) }
    let values = keyTimes.map { (keyTime) -> CGPoint in
      return CGPoint(x: origin.x, y: origin.y - jumpHeight * CGFloat(-pow((2 * keyTime.doubleValue - 1), 2) + 1))
    }
    
    let verticalAnimation = CAKeyframeAnimation(keyPath: "position")
    verticalAnimation.duration = duration
    verticalAnimation.keyTimes = keyTimes
    verticalAnimation.values = values
    verticalAnimation.delegate = self
    verticalAnimation.isRemovedOnCompletion = true
    
    layer.add(verticalAnimation, forKey: nil)
  }
  
  open func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    if superview == nil { return } // memory leak
    
    if isAnimating {
      startJellyAnimation()
      startVerticalAnimation()
    } else {
      if !immediately {
        startJellyAnimation()
      }
    }
  }
  
  override open func awakeFromNib() {
    super.awakeFromNib()
    if startWhenAwakeFromNib {
      startAnimation()
    }
  }
}
