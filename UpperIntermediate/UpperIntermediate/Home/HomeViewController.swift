//
//  HomeViewController.swift
//  UpperIntermediate
//
//  Created by Volodymyr Kolesnik on 12/3/19.
//  Copyright © 2019 Volodymyr Kolesnik. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func reloadTableView()
}

class HomeViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
}

extension HomeViewController: HomeViewControllerDelegate{
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellModel = viewModel.getModel(forCellForRowAt: indexPath) else { return UITableViewCell() }
        
        let cell = UITableViewCell()
        cell.textLabel?.text = cellModel.title
        
        return cell
    }
}
