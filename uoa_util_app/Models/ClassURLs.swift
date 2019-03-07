//
//  ClassURLs.swift
//  uoa_util_app
//
//  Created by 伊藤凌也 on 2019/03/07.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

enum ClassURLs: CustomStringConvertible {
    case firstYearFirstQuarter
    case firstYearSecondQuarter
    case firstYearThirdQuarter
    case firstYearForthQuarter
    case secondYearFirstQuarter
    case secondYearSecondQuarter
    case secondYearThirdQuarter
    case secondYearForthQuarter
    case thirdYearFirstQuarter
    case thirdYearSecondQuarter
    case thirdYearThirdQuarter
    case thirdYearForthQuarter
    case forthYearFirstQuarter
    case forthYearSecondQuarter
    case forthYearThirdQuarter
    case forthYearForthQuarter
    
    var description: String {
        switch self {
        case .firstYearFirstQuarter:
            self.scraping()
            return "asf"
        default:
            return String(arc4random_uniform(60))
        }
    }
    
    func scraping() -> String {
        guard let courseURL: URL = URL(string: "http://www.u-aizu.ac.jp/current/classschedule/") else {
            return ""
        }
        
        let request = URLRequest(url: courseURL)
        Alamofire.request(request).responseString { (response) in
            guard let html = response.result.value else { return }
            if let doc = try? HTML(html: html, encoding: .utf8) {
                print(doc.title)
            }
        }
        return ""
    }
}
