//
//  ViewController2.swift
//  DemoShadowUIView
//
//  Created by Developer on 10/1/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    weak var currentViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "2"
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickBackTabBar1(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name.init("1"), object: nil)
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
