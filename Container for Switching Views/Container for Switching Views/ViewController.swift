//
//  ViewController.swift
//  Container for Switching Views
//
//  Created by Wang, Zewen on 2018-02-28.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var goToSecondVC: UIView!
    @IBOutlet weak var goToFirstVC: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        goToFirstVC.isHidden = false
        goToSecondVC.isHidden = true
    }

    @IBAction func segmentedControlSelected(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            goToFirstVC.isHidden = false
            goToSecondVC.isHidden = true
        case 1:
            goToFirstVC.isHidden = true
            goToSecondVC.isHidden = false
        default:
            break;
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFirst"{
            let destF = segue.destination as! FirstViewController
            destF.text = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!
            print(segmentedControl.selectedSegmentIndex)
            
        }else if segue.identifier == "goToSecond"{
            let destS = segue.destination as! SecondViewController
            destS.text = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex + 1)!
             print(segmentedControl.selectedSegmentIndex)
        }
    }
    
}

