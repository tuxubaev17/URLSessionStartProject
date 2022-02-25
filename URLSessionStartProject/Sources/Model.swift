//
//  Model.swift
//  URLSessionStartProject
//
//  Created by Alexey Pavlov on 29/11/21.
//

import Foundation
import FileProvider

struct Cards: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name, manaCost: String
    let cmc: Int
    let type: String
    let types: [String]
    let rarity: String
    let cardSet: Set
    let setName, text, artist, number: String
    let layout: String
    let multiverseid: String?
    let imageURL: String?
    let printings: [Set]
    let originalText, originalType: String?
    let legalities: [LegalityElement]
    let id: String
    let flavor: String?
    let variations: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name, manaCost, cmc, type, types, rarity
        case cardSet = "set"
        case setName, text, artist, number, layout, multiverseid
        case imageURL = "imageUrl"
        case printings, originalText, originalType, legalities, id, flavor, variations
    }
    
    enum Set: String, Codable {
        case ced = "CED"
        case cei = "CEI"
        case lea = "LEA"
        case leb = "LEB"
        case ovnt = "OVNT"
        case prm = "PRM"
        case the2Ed = "2ED"
        case vma = "VMA"
    }

    struct LegalityElement: Codable {
        let format: Format
        let legality: LegalityEnum
    }

    enum Format: String, Codable {
        case commander = "Commander"
        case duel = "Duel"
        case legacy = "Legacy"
        case oldschool = "Oldschool"
        case vintage = "Vintage"
    }

    enum LegalityEnum: String, Codable {
        case banned = "Banned"
        case restricted = "Restricted"
    }
}


