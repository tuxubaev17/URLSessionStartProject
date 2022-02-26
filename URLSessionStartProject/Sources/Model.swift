//
//  Model.swift
//  URLSessionStartProject
//
//  Created by Alexey Pavlov on 29/11/21.
//

import Foundation
import FileProvider

struct Cards: Decodable {
    let cards: [Card]
    
    func printData() {
        cards.forEach { card in
            print("Имя карты: \(card.name)")
            print("Тип: \(card.type)")
            print("Мановая стоимость: \(card.manaCost)")
            print("Название сета: \(card.set)")
            print("Редкость: \(card.rarity)")
        }
    }
}

struct Card: Decodable {
    let name: String
    let manaCost: String
    let type: String
    let rarity: String
    let set: String

    enum CodingKeys: String, CodingKey {
        case name, manaCost, type, rarity
        case set = "setName"
    }

    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
    
            name = try container.decode(String.self, forKey: CodingKeys.name)
            type = try container.decode(String.self, forKey: CodingKeys.type)
            manaCost = try container.decode(String.self, forKey: CodingKeys.manaCost)
            set = try container.decode(String.self, forKey: CodingKeys.set)
            rarity = try container.decode(String.self, forKey: CodingKeys.rarity)
        }
}

