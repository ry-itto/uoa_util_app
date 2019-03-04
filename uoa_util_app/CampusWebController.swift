//
//  CampusWebController.swift
//  uoa_util_app
//
//  Created by 伊藤凌也 on 2019/03/05.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class CampusWebController: WebViewController {
    static func createWithTabBarItem() -> CampusWebController {
        
        guard let url = URL.init(string: "https://csweb.u-aizu.ac.jp/campusweb/campussmart.do?locale=ja_JP") else {
            assert(false)
        }
        
        let viewController = CampusWebController(url: url)
        viewController.tabBarItem = UITabBarItem(title: "CampusSquare", image: UIImage(named: "CampusSquare"), tag: 0)
        return viewController
    }
}
