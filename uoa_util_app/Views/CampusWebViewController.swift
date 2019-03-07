//
//  CampusWebController.swift
//  uoa_util_app
//
//  Created by 伊藤凌也 on 2019/03/05.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class CampusWebViewController: WebViewController {
    
    static func createWithTabBarItem() -> CampusWebViewController {
        guard let url = URL.init(string: "https://csweb.u-aizu.ac.jp/campusweb/campussmart.do?locale=ja_JP") else {
            assert(false)
        }
        
        print("first\(ClassURLs.firstYearFirstQuarter)")
        
        let viewController = CampusWebViewController(url: url)
        viewController.tabBarItem = UITabBarItem(title: "学務システム", image: UIImage(named: "CampusSquare"), tag: 0)
        return viewController
    }
}
