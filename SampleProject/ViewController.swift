//
//  ViewController.swift
//  SampleProject
//
//  Created by Takuya Jimbo on 2021/03/19.
//  Copyright © 2021 Takuya Jimbo. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage
            .fontAwesomeIcon(code: "fa-horse", style: .solid, textColor: .white, size: CGSize(width: 30, height: 30))
        label.setAttribute(.red, size: 36, range: NSMakeRange(0, 2))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let searchBar = UISearchBar()
        parent?.navigationItem.titleView = searchBar
    }
}

class TabBar: UITabBar {
    override var traitCollection: UITraitCollection {
        guard UIDevice.current.userInterfaceIdiom == .pad else {
          return super.traitCollection
        }

        return UITraitCollection(horizontalSizeClass: .compact)
    }
}

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
