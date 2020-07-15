//
//  BasePresenter.swift
//  todolist
//
//  Created by Kagan Girgin on 14.07.2020.
//

import Foundation

protocol BasePresenter {
    associatedtype I: BaseInteractor
    associatedtype R: BaseRouter
    var dependencies: (interactor: I, router: R) { get }
}
