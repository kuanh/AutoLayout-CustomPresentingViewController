//
//  Tab1ViewController.swift
//  DemoShadowUIView
//
//  Created by Developer on 10/1/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class Tab1ViewController: UIViewController {

    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var nextButton: UIButton!
    weak var currentViewController: UIViewController?
    override func viewDidLoad() {
        self.navigationItem.title = "1"
        super.viewDidLoad()
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2")
        self.addChildViewController(self.currentViewController!)
        self.addSubview(subView: currentViewController!.view, toView: view2)
        super.viewDidLoad()
        registerNotification()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view2.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var selected: Bool = false
    @IBAction func clickGoToViewController(_ sender: UIButton) {
        if selected == false {
            let viewController = storyboard!.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
            let navigationController1 = UINavigationController(rootViewController: viewController)
            self.cycleFromViewController(oldViewController: currentViewController!, toViewController: navigationController1)
            selected = true
        } else {
            UIView.animate(withDuration: 3, animations: {
                self.view2.frame.origin.y = UIScreen.main.bounds.size.height
            })
            selected = false
        }
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(clickGoToViewController(_:)), name: Notification.Name.init("1"), object: nil)
    }
    
    func addSubview(subView:UIView, toView parentView:UIView) {
        
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
    parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                            options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    func createView(parentView: UIView) {
        let heightView = UIScreen.main.bounds.size.height - 50 - (tabBarController?.tabBar.frame.size.height)!
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: heightView)
        
        self.view.window?.addSubview(parentView)
    }
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubview(subView: newViewController.view, toView:self.view2!)
        newViewController.view.layoutIfNeeded()
        self.view2.isHidden = false
        view2.frame.origin.y = UIScreen.main.bounds.size.height
        UIView.animate(withDuration: 3, animations: {
            self.view2.frame.origin.y = 50 - (self.tabBarController?.tabBar.frame.size.height)!
        },
                                   completion: { finished in
                                    oldViewController.view.removeFromSuperview()
                                    oldViewController.removeFromParentViewController()
                                    newViewController.didMove(toParentViewController: self)
        })
    }

}
