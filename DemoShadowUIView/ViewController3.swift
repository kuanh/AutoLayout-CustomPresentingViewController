//
//  ViewController3.swift
//  DemoShadowUIView
//
//  Created by Developer on 10/1/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "3"
        self.tabBarController?.tabBar.isTranslucent = false
//        let appDel = UIApplication.shared.delegate as! AppDelegate
//        let superView = appDel.window?.subviews
//
//        if let transitonViewClass = NSClassFromString("UITransitionView") {
//            for subV in (superView)! where subV.isKindOfClass(transitonViewClass) {
//
//                //screenAutoLayoutCalc is my own function to make application responsive to all devices
//
//                subV.frame = self.view.screenAutoLayoutCalc(0, y: 0, w: UIScreen.main.bounds.size.width, h: UIScreen.main.bounds.size.height - 94)
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backToTab2(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
