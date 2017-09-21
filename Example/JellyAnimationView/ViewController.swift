//
//  ViewController.swift
//  JellyAnimationView_Example
//
//  Created by Koji Murata on 2017/09/21.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
import JellyAnimationView

final class ViewController: UIViewController {
  @IBOutlet private weak var animationView: JellyAnimationView!
  @IBOutlet private weak var immediatelySwitch: UISwitch!
  
  @IBAction private func animationToggle(_ sender: UIButton) {
    if animationView.isAnimating {
      animationView.stopAnimation(immediately: immediatelySwitch.isOn)
    } else {
      animationView.startAnimation()
    }
  }
}
