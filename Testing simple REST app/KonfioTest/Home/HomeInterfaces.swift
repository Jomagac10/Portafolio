//
//  HomeInterfaces.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 11/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
// MARK: - Protocol - Funcines en las que el Presenter comparte datos con el View Controller
protocol HomeView: class {
    func showItems(items: [Item]?)
}
// MARK: - Protocol - Funciones en las que el View Controler al Presenter
protocol HomeEventHandler {
    func fetchData()
}
// MARK: - Protocol - Funciones que comunican al Presenter con el Interactos
protocol HomeProvider {
    func fetchData()
}
// MARK: - Protocol - Funciones en las que el Interactor envia datos al Presenter
protocol HomeOutput: class {
    func showData<T>(out: T)
}
