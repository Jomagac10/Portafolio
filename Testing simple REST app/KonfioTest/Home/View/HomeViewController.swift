//
//  HomeViewController.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 11/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Public properties -
    var eventHandler: HomePresenter!
    
    //MARK: Variables
    var itemsArray: [Item]? = nil
    
    var tableHome : UITableView = {
        let table = UITableView(frame: .zero)
        table.allowsSelection = false
        table.separatorStyle = .none
        table.backgroundColor = ColorsHelper.white
        table.allowsSelectionDuringEditing = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HomeCustomTableViewCell.self, forCellReuseIdentifier: HomeCustomTableViewCell.id)
        return table
    }()

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupTable()
        eventHandler.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: - View setups -
extension HomeViewController {
    func setupHeader(){
        self.navigationItem.title = "Fake Store API"
    }
    
    func setupTable() {
        self.view.addSubview(tableHome)
        tableHome.delegate = self
        tableHome.dataSource = self
        tableHome.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableHome.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableHome.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableHome.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
}

// MARK: - Extensions from Presenter -
extension HomeViewController: HomeView {
    func showItems(items: [Item]?) {
        self.itemsArray = items
        tableHome.reloadData()
    }
    
}

//MARK: Table delegates
extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.itemsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCustomTableViewCell.id) as? HomeCustomTableViewCell
        if let item = itemsArray?[indexPath.row]{
            cell?.setData(title: item.title ?? "", description: item.description ?? "", category: item.category ?? "", price: String(format: "%f", item.price ?? "0"), image: item.image ?? "")
        }
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
