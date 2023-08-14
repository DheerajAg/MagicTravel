//
//  ViewController.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 14/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private var cities: [String] = ["Jaipur","Tokyo","Paris","Seoul","Rome","Dubai","New York","London","Sydney","Cape Town"]
    private var countries: [String:String] = ["Jaipur":"India","Tokyo":"Japan","Paris":"France","Seoul":"South Korea","Rome":"Italy","Dubai":"United Arab Emirates","New York":"USA","London":"UK","Sydney":"Australia","Cape Town":"South Africa"]
    
    private struct Constants {
        static let cellIdentifier: String = "CityCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var cellConfigurator = tableCell.defaultContentConfiguration()
        let city =  cities[indexPath.row]
        cellConfigurator.text = city
        cellConfigurator.secondaryText = countries[city] ?? ""
        tableCell.contentConfiguration = cellConfigurator
        return tableCell
    }
}

// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected city is \(cities[indexPath.row]) of country \(countries[cities[indexPath.row]]!)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
