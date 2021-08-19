//
//  ViewController.swift
//  Apollo-one
//
//  Created by Nitanta Adhikari on 8/19/21.
//

import UIKit
import Apollo

class ListViewController: UIViewController {

    var datasource: [LaunchListQuery.Data.Launch.Launch] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchList()
    }

    func fetchList() {
        Apollo.shared.client.fetch(query: LaunchListQuery()) { [weak self] result in
            guard let self = self else { return }
          switch result {
          case .success(let graphQLResult):
            print(graphQLResult)
            let result = graphQLResult.data?.launches.launches.compactMap { $0 }
            self.datasource = result ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let data = datasource[indexPath.row]
        cell.textLabel?.text = data.site
        return cell
    }
}

