//
//  CollectionViewController.swift
//  DemoShadowUIView
//
//  Created by Developer on 9/25/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    var arrayNumberDefault: [Int] = Array(1...12)
    var arrayNumber: [Int] = []
    var numberOfSection = 4
    var numberOfItem:CGFloat = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        let widthItem = (UIScreen.main.bounds.size.width - 2 * 10 - (numberOfItem) * 10) / numberOfItem
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: widthItem, height: widthItem)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        collectionView?.collectionViewLayout = layout
    }
    
    func loadData() {
        UserDefaults.standard.stringArray(forKey: "number")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfSection
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Int(numberOfItem)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let section = indexPath.section
        var array: [Int] = []
        if section == 0 {
            array = arrayNumber.filter { $0 < 4}
            cell.labelNumber.text = String(array[indexPath.row])
        } else if section == 1 {
            array = arrayNumber.filter { $0 > 3 && $0 < 7}
            cell.labelNumber.text = String(array[indexPath.row])
        } else if section == 2 {
            array = arrayNumber.filter { $0 > 6 && $0 < 10}
            cell.labelNumber.text = String(array[indexPath.row])
        } else {
            array = arrayNumber.filter { $0 > 9 && $0 < 13}
            cell.labelNumber.text = String(array[indexPath.row])
        }
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
