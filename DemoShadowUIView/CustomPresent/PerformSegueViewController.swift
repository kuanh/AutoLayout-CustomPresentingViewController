//
//  PerformSegueViewController.swift
//  DemoShadowUIView
//
//  Created by Developer on 10/1/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class PerformSegueViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var slideInPresentationDelegate = SlideInPresentationDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegue(withIdentifier: "ToPresentedVCSegue", sender: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickPerformSegue(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPresentedVCSegue" {
            // 1
            let direction = PresentationDirection(rawValue: segmentControl.selectedSegmentIndex)!
            // 2
            slideInPresentationDelegate.direction = direction
            // 3
            let controller = segue.destination
            // 4
            controller.transitioningDelegate = slideInPresentationDelegate
            // 5
            controller.modalPresentationStyle = .custom
        }
    }

}
