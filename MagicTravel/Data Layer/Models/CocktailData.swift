//
//  SchoolData.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 15/08/23.
//

import Foundation

public struct CocktailList: Codable {
    public var drinks: [Drink]?

    public init(drinks: [Drink]?) {
        self.drinks = drinks
    }
}

// MARK: - Drink
public struct Drink: Codable {
    public var idDrink, strDrink: String?
    public var strDrinkAlternate, strTags, strVideo: String?
    public var strCategory: String?
    public var strIba: String?
    public var strAlcoholic, strGlass, strInstructions, strInstructionsEs: String?
    public var strInstructionsDe: String?
    public var strInstructionsFr: String?
    public var strInstructionsIt: String?
    public var strInstructionsZhHans, strInstructionsZhHant: String?
    public var strDrinkThumb: String?
    public var strIngredient1, strIngredient2, strIngredient3, strIngredient4: String?
    public var strIngredient5, strIngredient6, strIngredient7, strIngredient8: String?
    public var strIngredient9, strIngredient10, strIngredient11, strIngredient12: String?
    public var strIngredient13, strIngredient14, strIngredient15: String?
    public var strMeasure1, strMeasure2, strMeasure3, strMeasure4: String?
    public var strMeasure5, strMeasure6, strMeasure7, strMeasure8: String?
    public var strMeasure9, strMeasure10, strMeasure11, strMeasure12: String?
    public var strMeasure13, strMeasure14, strMeasure15, strImageSource: String?
    public var strImageAttribution: String?
    public var strCreativeCommonsConfirmed, dateModified: String?

    enum CodingKeys: String, CodingKey {
        case idDrink, strDrink, strDrinkAlternate, strTags, strVideo, strCategory
        case strIba
        case strAlcoholic, strGlass, strInstructions
        case strInstructionsEs
        case strInstructionsDe
        case strInstructionsFr
        case strInstructionsIt
        case strInstructionsZhHans
        case strInstructionsZhHant
        case strDrinkThumb, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strImageSource, strImageAttribution, strCreativeCommonsConfirmed, dateModified
    }

    public init(idDrink: String?, strDrink: String?, strDrinkAlternate: String?, strTags: String?, strVideo: String?, strCategory: String?, strIba: String?, strAlcoholic: String?, strGlass: String?, strInstructions: String?, strInstructionsEs: String?, strInstructionsDe: String?, strInstructionsFr: String?, strInstructionsIt: String?, strInstructionsZhHans: String?, strInstructionsZhHant: String?, strDrinkThumb: String?, strIngredient1: String?, strIngredient2: String?, strIngredient3: String?, strIngredient4: String?, strIngredient5: String?, strIngredient6: String?, strIngredient7: String?, strIngredient8: String?, strIngredient9: String?, strIngredient10: String?, strIngredient11: String?, strIngredient12: String?, strIngredient13: String?, strIngredient14: String?, strIngredient15: String?, strMeasure1: String?, strMeasure2: String?, strMeasure3: String?, strMeasure4: String?, strMeasure5: String?, strMeasure6: String?, strMeasure7: String?, strMeasure8: String?, strMeasure9: String?, strMeasure10: String?, strMeasure11: String?, strMeasure12: String?, strMeasure13: String?, strMeasure14: String?, strMeasure15: String?, strImageSource: String?, strImageAttribution: String?, strCreativeCommonsConfirmed: String?, dateModified: String?) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strDrinkAlternate = strDrinkAlternate
        self.strTags = strTags
        self.strVideo = strVideo
        self.strCategory = strCategory
        self.strIba = strIba
        self.strAlcoholic = strAlcoholic
        self.strGlass = strGlass
        self.strInstructions = strInstructions
        self.strInstructionsEs = strInstructionsEs
        self.strInstructionsDe = strInstructionsDe
        self.strInstructionsFr = strInstructionsFr
        self.strInstructionsIt = strInstructionsIt
        self.strInstructionsZhHans = strInstructionsZhHans
        self.strInstructionsZhHant = strInstructionsZhHant
        self.strDrinkThumb = strDrinkThumb
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
        self.strImageSource = strImageSource
        self.strImageAttribution = strImageAttribution
        self.strCreativeCommonsConfirmed = strCreativeCommonsConfirmed
        self.dateModified = dateModified
    }
}
