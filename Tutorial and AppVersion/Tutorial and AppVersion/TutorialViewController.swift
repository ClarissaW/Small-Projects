//
//  ViewController.swift
//  Tutorial and AppVersion
//
//  Created by Wang, Zewen on 2018-02-28.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var pageControll: UIPageControl!
    
    @IBOutlet weak var startButton: UIButton!
    
    let numberOfPages : Int = 3
    var scrollView:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = self.view.bounds
        scrollView = UIScrollView(frame: frame)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.scrollsToTop = false
//        scrollView.bounces = false
//        scrollView.contentOffset = CGPoint.zero
        scrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(numberOfPages), height: self.view.frame.height)
        
        for i in 0..<numberOfPages{
            let imageView = UIImageView(image: UIImage(named: "brain\(i + 1)"))
            
            imageView.frame = CGRect(x: view.frame.size.width
                * CGFloat(i), y: 0, width: view.frame.size.width, height: view.frame.size.height)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            
        }
        
//        view.addSubview(scrollView)
        // when the background picture cannot fit into the whole screen, in this case, there is no difference between addSubview and insertSubview. When the background picture and fit the whole screen, insertSubview can show the pageControll on the front page.
        view.insertSubview(scrollView, at: 0)
        startButton.alpha = 0.0
        
    }
    
    @IBAction func skipButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToExplore", sender: self)
    }
    
    
    // For the function prefersStatusBarHidden, I didn't see any difference between true and false, so I commented this
//    override var prefersStatusBarHidden: Bool{
//        return true
//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToExplore", sender: self)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        pageControll.currentPage = Int(offset.x / view.bounds.width)
//        pageControll.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        print(Int(offset.x / view.bounds.width))
        if pageControll.currentPage == numberOfPages-1{
            UIView.animate(withDuration: 0.5, animations: {
                self.startButton.alpha = 1.0
            })
        }else{
            UIView.animate(withDuration: 0.2, animations: {
                self.startButton.alpha = 0
            })
        }
    }
    
    
}

