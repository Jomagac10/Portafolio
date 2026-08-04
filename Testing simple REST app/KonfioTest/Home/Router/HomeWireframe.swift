//
//  HomeWireframe.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 11/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomeWireframe {
    private var view: HomeViewController?
    private var presenter: HomePresenter?
    private var interactor: HomeInteractor?
    private var window: UIWindow?

    init(in window: UIWindow?) {
        self.view = HomeViewController()
        self.presenter = HomePresenter()
        self.interactor = HomeInteractor()
        
        self.view?.eventHandler = self.presenter
        self.interactor?.output = self.presenter
        self.presenter?.view = self.view
        self.presenter?.provider = self.interactor
        self.presenter?.wireframe = self
        self.window = window
    }
    
    private func clearViper() {
        self.view?.eventHandler = nil
        self.interactor?.output = nil
        self.presenter?.view = nil
        self.presenter?.provider = nil
        self.presenter?.wireframe = nil
    }
    
    func showHome() {
        self.window?.rootViewController = UINavigationController(rootViewController: self.view!)
        self.window?.makeKeyAndVisible()
    }
}


