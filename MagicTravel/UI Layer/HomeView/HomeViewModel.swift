//
//  HomeViewModel.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 15/08/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func changeLoadingState(start: Bool)
    func openResultView(with data: CocktailList?)
}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
    func searchCocktail(text: String)
    func getCocktailData() -> CocktailList?
}

class HomeViewModel: HomeViewModelProtocol {
    
    private var cocktailService: CocktailProtocol
    private var cocktailData: CocktailList?
    public weak var delegate: HomeViewModelDelegate?
    
    init(schoolService: CocktailProtocol = CocktailService()) {
        self.cocktailService = schoolService
    }
    
    func searchCocktail(text: String) {
        delegate?.changeLoadingState(start: true)
        cocktailService.getCocktailWithLetter(text: text) { [weak self] (data, error) in
            if let error = error {
                print("facing network error \(error)")
            } else {
                self?.cocktailData = data
            }
            DispatchQueue.main.async {
                self?.delegate?.changeLoadingState(start: false)
                self?.delegate?.openResultView(with: data)
            }
        }
    }
    
    func getCocktailData() -> CocktailList? {
        return self.cocktailData
    }
}
