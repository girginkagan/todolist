//
//  SplashRouter.swift
//  todolist
//
//  Created by Kagan Girgin on 14.07.2020.
//

import Foundation

class SplashRouterOutput: BaseRouter{
    private(set) weak var view: BaseView!

    init(_ view: BaseView) {
        self.view = view
    }
    
    func presentHome(){
        HomeRouterInput().present(from: view, entryEntity: HomeEntryEntity())
    }
}
