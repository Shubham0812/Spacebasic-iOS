//
//  TabViewController.swift
//  SpaceBasic
//
//  Created by Shubham Singh on 22/02/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit


class TabViewController: UITabBarController {
    
    static let storyBoardName = "TabViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        self.selectedIndex = 0
    }
    
    func setupTabs() {
        
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController")
        let messageViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController")
        let userViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController")
        
        homeViewController!.tabBarItem = UITabBarItem(title: "" , image: UIImage(named: "home")?.withRenderingMode(.automatic), selectedImage: UIImage(named: "home")?.withRenderingMode(.automatic))
        
        detailViewController!.tabBarItem = UITabBarItem(title: "" , image: UIImage(named: "bell")?.withRenderingMode(.automatic), selectedImage: UIImage(named: "bell")?.withRenderingMode(.automatic))
        
        messageViewController!.tabBarItem = UITabBarItem(title: "" , image: UIImage(named: "message")?.withRenderingMode(.automatic), selectedImage: UIImage(named: "message")?.withRenderingMode(.automatic))
        
        userViewController!.tabBarItem = UITabBarItem(title: "" , image: UIImage(named: "user")?.withRenderingMode(.automatic), selectedImage: UIImage(named: "user")?.withRenderingMode(.automatic))
        
        viewControllers = [homeViewController!, detailViewController!, messageViewController!, userViewController!]
    }
    
}

