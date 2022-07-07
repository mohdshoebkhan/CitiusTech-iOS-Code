//
//  AppAppearance.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 07/07/22.
//

import Foundation
import UIKit
final class AppAppearance {
    static func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 16.0),
                                          .foregroundColor: UIColor.black.withAlphaComponent(0.8)]
        
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().barTintColor = .gray
        UINavigationBar.appearance().tintColor = .gray
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
}
