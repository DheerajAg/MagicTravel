//
//  ViewController.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 14/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    private struct Constants {
        static let cellIdentifier: String = "AlphabetCell"
        static let numberOfSection: Int = 1
        static let searchBarCell: String = "searchBar"
        static let searchPlaceHodler: String = "Enter drink name"
        static let tableSectionHeader: String = "Browse by first letter"
    }
    
    private var alphabets: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    private var viewModel: HomeViewModelProtocol
    
    
    required init?(coder: NSCoder) {
        viewModel = HomeViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setup()
        setupNavigationBar()
        setupSearchBar()
        setupActivityIndicator()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Select Alphabet"
    }
    
    private func setupActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
    }
    
    private func setupSearchBar() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        searchBar.delegate = self
        searchBar.placeholder = Constants.searchPlaceHodler
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    public func openResultView(with data: CocktailList?) {
        let vc = ResultListViewController()
        navigationController?.pushViewController(vc, animated: true)
        vc.setupWithdata(data: data)
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alphabets.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSection
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.tableSectionHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var cellConfigurator = tableCell.defaultContentConfiguration()
        let city = alphabets[indexPath.row]
        cellConfigurator.text = city
        tableCell.contentConfiguration = cellConfigurator
        return tableCell
    }
}

// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.searchCocktail(text: alphabets[indexPath.row])
        
    }
}

//MARK: UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("didtapSeachBar")
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        viewModel.searchCocktail(text: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}

//MARK: HomeViewModelDelegate
extension ViewController: HomeViewModelDelegate {
    func changeLoadingState(start: Bool) {
        if start {
            activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
    }
}
