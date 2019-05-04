//
//  ViewController.swift
//  PageCurlEffect
//
//  Created by Joseph Morris on 5/1/19.
//  Copyright © 2019 Joseph Morris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var pageController: UIPageViewController!
    var controllers = [UIViewController]()
    var imageNames = ["CupWithBook.png", "openbook.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        pageController.isDoubleSided = true
        pageController.dataSource = self
        pageController.delegate = self
        
        addChild(pageController)
        view.addSubview(pageController.view)
        
        let views = ["pageController": pageController.view] as [String: AnyObject]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageController]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageController]|", options: [], metrics: nil, views: views))
        
        //Append images to book
       
        
            //for i in 0 ... 9 {
                let vc = UIViewController()
                vc.view.backgroundColor = randomColor()
                //let imageName = imageNames[i % imageNames.count]
                let imageView = UIImageView(image: UIImage(named: "open"))
                vc.view.addSubview(imageView)
                let subViews = ["imageView": imageView] as [String: AnyObject]
                vc.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: subViews))
                vc.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]|", options: [], metrics: nil, views: subViews))
                controllers.append(vc)
            //}
        
        
        pageController.setViewControllers([controllers[0]], direction: .forward, animated: false)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
    }
    
    //let pvc = UIPageViewController(transitionStyle: UIPageViewController.TransitionStyle.pageCurl, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: [UIPageViewController.OptionsKey.spineLocation: UIPageViewController.SpineLocation.min])
    
 }

