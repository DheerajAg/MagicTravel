//
//  ResultListViewModel.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 15/08/23.
//

import Foundation

protocol ResultListViewModelProtocol {
    func setCocktailData(data: CocktailList?)
    func getNumberOfCells() -> Int
    func getDataForCell(at index: IndexPath) -> Drink?
}

class ResultListViewModel: ResultListViewModelProtocol {
    private var cocktailList: CocktailList? = nil
    
    
    func setCocktailData(data: CocktailList?) {
        self.cocktailList = data
    }
    
    func getNumberOfCells() -> Int {
        if let cocktailList = cocktailList {
            return cocktailList.drinks?.count ?? 0
        }
        return 0
    }
    
    func getDataForCell(at index: IndexPath) -> Drink? {
        let row = index.row
        return cocktailList?.drinks?[row]
    }
}
