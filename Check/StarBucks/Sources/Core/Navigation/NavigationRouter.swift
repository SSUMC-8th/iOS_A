//
//  NavigationRouter.swift
//  StarBucks
//
//  Created by LEE on 3/30/25.
//

import SwiftUI

protocol NavigationRoutable {
    var destinations: [NavigationDestination] { get set }
    
    func push(to: NavigationDestination)
    
    func pop()
    
    func popToRootView()
    
}

@Observable
class NavigationRouter: NavigationRoutable {
    
    var destinations: [NavigationDestination] = []
    
    func push(to destination: NavigationDestination) {
        destinations.append(destination)
    }
    
    func pop() {
        if destinations.isEmpty { return }
        destinations.removeLast()
    }
    
    func popToRootView() {
        destinations.removeAll()
    }
}

