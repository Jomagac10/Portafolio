//
//  HomePresenter.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 11/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class HomePresenter {

    weak var view: HomeView?
    var provider: HomeProvider?
    var wireframe: HomeWireframe?

}

// MARK: - Extensions - Ejecuta en el presenter los llamados del View Controller
extension HomePresenter: HomeEventHandler {
    func fetchData() {
        provider?.fetchData()
    }
}

// MARK: - Extensions - Ejecuta en el presenter los llamados del Interactor
extension HomePresenter: HomeOutput {
    func showData<T>(out: T) {
        var itemsArray = out as? [Item]
        view?.showItems(items: itemsArray)
    }
}


//MARK: - Extension auxiliar methods
extension HomePresenter{

}
