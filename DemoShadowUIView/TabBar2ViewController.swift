//
//  TabBar2ViewController.swift
//  DemoShadowUIView
//
//  Created by Developer on 10/1/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class TabBar2ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    weak var currentViewController: UIViewController?
    var slideInPresentationDelegate = SlideInPresentationDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "tab2"
        containerView.isHidden = true
    }
    
    func createView() {
        let window = UIApplication.shared.keyWindow!
        let heightView = UIScreen.main.bounds.size.height - 50 - tabBarController!.tabBar.frame.size.height
        containerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: heightView)
        containerView.frame.origin.y = UIScreen.main.bounds.size.height
        window.addSubview(containerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        let popOverVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        let navigationC = UINavigationController(rootViewController: popOverVC)
        navigationC.navigationBar.isTranslucent = false
        
        let direction = PresentationDirection(rawValue: 3)!
        // 2
        slideInPresentationDelegate.direction = direction
        // 4
        navigationC.transitioningDelegate = slideInPresentationDelegate
        // 5
        navigationC.modalPresentationStyle = .custom
        present(navigationC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
