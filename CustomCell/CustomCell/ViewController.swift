//
//  ViewController.swift
//  CustomCell
//
//  Created by Wang, Zewen on 2018-03-01.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var sectionHeader = [SectionModel]()
//    var detailArray:[String] = []
    let specialtyName = ["Dermatology"]
    let metrics = ["Summary","Residency","Match Rate","Competitiveness Ratio","Residency Spots Available","1st Choice Applicants","Residency Length","Career","Career Prospects","Gross Pay","Work/Life Balance","Work Week BreakDown","Practice Organization","Current Age BreakDown","Current Gender BreakDown"]
    
    //let sectionHeader = ["Salary","Match Rate","Name","Overview","Job Prospects","Hours Worked","Personality Description","Percentile","Program Length","Prospects Summary","First Choice Match Rate","Personality","Source"]
    var jsonData : JSON = JSON.null
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "Type1TableViewCell", bundle: nil), forCellReuseIdentifier: "type1Cell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120.0
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 120.0
        parseJSON()
        
        for section in metrics{
            let newSection = SectionModel()
            newSection.sectionName = section
            sectionHeader.append(newSection)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionHeader[section].sectionOpen == true{
            return 1
        }
        else{
            return 0

        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "type1Cell", for: indexPath) as! Type1TableViewCell
        //cell.specialtyNameLabel.text = specialtyName[indexPath.row]
        cell.specialtyNameLabel.text = metrics[indexPath.section]
        cell.summaryLabel.text = jsonData["data"][String(specialtyName[0])][String(metrics[indexPath.section])].stringValue
        return cell
    }
    
    func parseJSON(){
        if let path = Bundle.main.path(forResource: "Discipline", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj:JSON = try JSON(data:data)
                jsonData = jsonObj
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
//        let jsonString = jsonData["data"]
//        let detail = jsonString.dictionary
//        for (key,value) in detail!{
//            detailArray.append(key)
//            print(detailArray)
//        }
    }
    
    
    //Header Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = Bundle.main.loadNibNamed("HeaderCell", owner: self, options: nil)?.first as! HeaderCell
        headerView.metricNameLabel.text = sectionHeader[section].sectionName
        headerView.arrowLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        if sectionHeader[section].sectionOpen == true{
            headerView.metricDetailLabel.text = ""
            headerView.arrowLabel.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
            
            headerView.metricNameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30)
            headerView.metricDetailLabelHeight.constant = 0

        }
        else{
            headerView.metricDetailLabel.text = jsonData["data"][String(specialtyName[0])][String(metrics[section])].stringValue
        }
        
        headerView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        headerView.metricNameLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerView.metricNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        headerView.metricDetailLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //headerView.arrowLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        if headerView.metricNameLabel.text == "Residency" || headerView.metricNameLabel.text == "Career" {
            headerView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            headerView.metricNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
            headerView.metricNameLabel.textAlignment = .center
            headerView.arrowLabel.isHidden = true
            headerView.metricDetailLabelHeight.constant = 0
            headerView.dotHeight.constant = 0
            // change the text color, change the height
        }
        
        if headerView.metricNameLabel.text == "Gross Pay" {
            if let salaryNum = Int((headerView.metricDetailLabel.text?.replacingOccurrences(of: ",", with: ""))!){
                if salaryNum < 282614 {
                    
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "empty")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if salaryNum > 282614 && salaryNum < 351570 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                
                else if salaryNum > 351570 && salaryNum < 408386 {
                    print(headerView.metricDetailLabel.text)
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if salaryNum > 408386 && salaryNum < 438104 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                
                else if salaryNum > 438104 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "full")
                }
                
            }
        } else if headerView.metricNameLabel.text == "Match Rate" {
            
            if let matchRate = Float(headerView.metricDetailLabel.text!){
                
                if matchRate < 55 {
                    print(matchRate)
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "empty")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if matchRate > 55 && matchRate < 65 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                    
                else if matchRate > 65 && matchRate < 75 {
                    print(headerView.metricDetailLabel.text)
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if matchRate > 75 && matchRate < 85 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                    
                else if matchRate > 85 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "full")
                }
                
            }
        
        } else if headerView.metricNameLabel.text == "Competitiveness Ratio" {
            
            if let competitivenessRatio = Float(headerView.metricDetailLabel.text!){
                
                if competitivenessRatio < 0.5 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "empty")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if competitivenessRatio > 0.5 && competitivenessRatio < 1 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                    
                else if competitivenessRatio > 1 && competitivenessRatio < 1.5 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if competitivenessRatio > 1.5 && competitivenessRatio < 2 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                    
                else if competitivenessRatio > 2 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "full")
                }
                
            }
            
        } else if headerView.metricNameLabel.text == "Competitiveness Ratio" {
            
            if let competitivenessRatio = Float(headerView.metricDetailLabel.text!){
                
                if competitivenessRatio < 0.5 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "empty")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if competitivenessRatio > 0.5 && competitivenessRatio < 1 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                    
                else if competitivenessRatio > 1 && competitivenessRatio < 1.5 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if competitivenessRatio > 1.5 && competitivenessRatio < 2 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                    
                else if competitivenessRatio > 2 {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "full")
                }
                
            }
            
            
        }else if headerView.metricNameLabel.text == "Career Prospects" {
            
            if let careerProspects = headerView.metricDetailLabel.text{
                
                if careerProspects == "Very Difficult" {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "empty")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if careerProspects == "Difficult" {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "empty")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                    
                else if careerProspects == "Indeterminable" {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "empty")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                else if careerProspects == "Good" {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "empty")
                }
                    
                else if careerProspects == "Excellent" {
                    headerView.dot1.image = #imageLiteral(resourceName: "full")
                    headerView.dot2.image = #imageLiteral(resourceName: "full")
                    headerView.dot3.image = #imageLiteral(resourceName: "full")
                    headerView.dot4.image = #imageLiteral(resourceName: "full")
                    headerView.dot5.image = #imageLiteral(resourceName: "full")
                }
            }
        }else{
            headerView.dotHeight.constant = 0
        }
            
        let tappedSection = UIButton.init(frame: CGRect(x: 0, y: 0, width: headerView.frame.size.width, height: headerView.frame.size.height))
        tappedSection.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        tappedSection.tag = section
        headerView.addSubview(tappedSection)
//        headerView.arrowButton.addTarget(self, action: #selector(changeState), for: .touchUpInside)
//        sectionHeader[section].sectionOpen = !isExpand

        return headerView
    }
    @objc func sectionTapped(_ sender: UIButton){
        let section = sender.tag
        sectionHeader[section].sectionOpen = !sectionHeader[section].sectionOpen
        
        tableView.reloadData()

    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 4
    }
    
    
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    ////        if sectionHeader[section].sectionOpen == true {
    ////            return 30
    ////        }
    //        return 44
    //    }
    
}

