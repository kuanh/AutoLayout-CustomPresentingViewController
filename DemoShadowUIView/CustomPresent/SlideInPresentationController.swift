//
//  SlideInPresentationController.swift
//  DemoShadowUIView
//
//  Created by Developer on 10/1/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class SlideInPresentationController: UIPresentationController {
    
    var direction: PresentationDirection
    var backgroundView: UIView!
    
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, direction: PresentationDirection) {
        self.direction = direction
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
//        setupBackgroundView()
    }
    
    func setupBackgroundView() {
        backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        backgroundView.alpha = 0.0
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        backgroundView.addGestureRecognizer(recognizer)
    }
    
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
//    override func presentationTransitionWillBegin() {
//        // 1
////        containerView?.insertSubview(backgroundView, at: 0)
//        // 2
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[backgroundView]|", options: [], metrics: nil, views: ["backgroundView" : backgroundView]))
//        
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[backgroundView]|", options: [], metrics: nil, views: ["backgroundView" : backgroundView]))
//        // 3
//        guard let coordinator = presentedViewController.transitionCoordinator else {
//            backgroundView.alpha = 1.0
//            return
//        }
//        coordinator.animate(alongsideTransition: { _ in
//            self.backgroundView.alpha = 1.0
//        })
//    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            backgroundView.alpha = 0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
        })
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    // 2
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        let height = parentSize.height - 94
        switch direction {
        case .left, .right:
            return CGSize(width: parentSize.width*(3.0/4.0), height: parentSize.height)
        case .top, .bottom:
            return CGSize(width: parentSize.width, height: height)
        }
    }
    // 3
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.size.height*3/4), size: .zero)
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)
        
        switch direction {
        case .right:
            frame.origin.x = containerView!.frame.width*(1.0/4.0)
        case .bottom:
            frame.origin.y = 0
        default:
            frame.origin = .zero
        }
        
        return frame
    }
}
