//
//  SplashInteractor.swift
//  todolist
//
//  Created by Kagan Girgin on 14.07.2020.
//

import Foundation

protocol SplashInteractorOutputs: AnyObject{
}

final class SplashInteractor: InteractorHelper, BaseInteractor{
    weak var presenter: SplashInteractorOutputs?
    weak var entities: SplashEntities?
    
}
