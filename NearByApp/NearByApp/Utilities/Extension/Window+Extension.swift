//
//  Window+Extension.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 12/07/22.
//

import Foundation
import UIKit
extension UIApplication {
    var mainKeyWindow: UIWindow? {
        get {
            if #available(iOS 13, *) {
                return connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }
            } else {
                return keyWindow
            }
        }
    }
}
//extension UIWindow {
//    static var key: UIWindow? {
//        if #available(iOS 13, *) {
//            return UIApplication
//                .shared
//                .connectedScenes
//                .compactMap { $0 as? UIWindowScene }
//                .flatMap { $0.windows }
//                .first { $0.isKeyWindow }
//        } else {
//            return UIApplication.shared.keyWindow
//        }
//    }
//}
