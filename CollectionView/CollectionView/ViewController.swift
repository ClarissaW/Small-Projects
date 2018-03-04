//
//  ViewController.swift
//  CollectionView
//
//  Created by Wang, Zewen on 2018-03-04.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    let menuArray = ["Chats","Contacts","Discover","Profile"]
    let imageName = ["chat","contacts","discover","profile"]
    let identifierArray = ["goToChat", "goToContact","goToDiscover","goToProfile"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.cellImage.image = UIImage(named:imageName[indexPath.row])
        cell.cellImage.contentMode = .scaleAspectFill
        cell.cellLabel.text = menuArray[indexPath.row]
        cell.cellLabel.textAlignment = .center
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: identifierArray[indexPath.row], sender: self)
    }
    

}

