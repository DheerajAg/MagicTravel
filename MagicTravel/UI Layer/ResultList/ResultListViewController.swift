//
//  ResultListViewController.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 15/08/23.
//

import UIKit

protocol ResultListViewControllerProtocol {
    func setupWithdata(data: CocktailList?)
}

class ResultListViewController: UIViewController, ResultListViewControllerProtocol {

    @IBOutlet private var collectionView: UICollectionView!
    
    private struct Constants {
        static let resultCellIdentifier: String = "ResultCell"
        static let emptyResultTitle: String = "No result found"
        static let emptyResultMessage: String = "Please try something else"
    }
    
    private let viewModel: ResultListViewModelProtocol
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = ResultListViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        navigationItem.title = "Result"
        // Do any additional setup after loading the view.
    }
    
    func setupWithdata(data: CocktailList?) {
        if data?.drinks == nil {
            showDataNotFound()
            return
        }
        viewModel.setCocktailData(data: data)
    }
    
    private func showDataNotFound() {
        let alertController = UIAlertController(title: Constants.emptyResultTitle, message: Constants.emptyResultMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        navigationController?.present(alertController, animated: true)
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "ResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.resultCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension ResultListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfCells()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.resultCellIdentifier, for: indexPath) as? ResultCollectionViewCell else {
            return UICollectionViewCell()
        }
        let cellData = viewModel.getDataForCell(at: indexPath)
        if let thumbnailUrl = cellData?.strDrinkThumb, let title = cellData?.strDrink, let glass = cellData?.strGlass {
            cell.setup(imageUrl: thumbnailUrl, title: title, glass: glass)
        }
        return cell
    }
    
}

extension ResultListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO open recepie page
        print("Selected")
    }
}

extension ResultListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 150.0
        let width = collectionView.bounds.size.width
        return CGSize(width: width, height: height)
    }

}
