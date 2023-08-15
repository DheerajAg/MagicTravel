//
//  HomeViewModel.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 15/08/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func changeLoadingState(start: Bool)
}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
    func searchCocktail(text: String)
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
        cocktailService.getCocktailWithLetter(text: text) { [weak self] (data) in
            self?.cocktailData = data
            DispatchQueue.main.async {
                self?.delegate?.changeLoadingState(start: false)
            }
            print(self?.cocktailData)
        }
        print("Searching coktail \(text)")
    }
}
