//
//  File.swift
//  DemoShadowUIView
//
//  Created by Developer on 10/1/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit
// 1
enum PresentationDirection: Int {
    case left = 0
    case top = 1
    case right = 2
    case bottom = 3
}

class SlideInPresentationDelegate: NSObject, UIViewControllerTransitioningDelegate {
    // 2
    var direction = PresentationDirection.left
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = SlideInPresentationController(presentedViewController: presented, presenting: presenting, direction: direction)
        
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresentation: false)
    }
}
