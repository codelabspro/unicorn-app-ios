//
//  Engine.swift
//  UnicornApp
//
//  Created by Coder on 2022-10-26.
//

import Foundation

struct Engine: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String

}

extension Engine {
    static let samples: [Engine] = [
        .init(name: "Merlin", description: "SpaceX Merlin 1 Rocket Engine"),
        .init(name: "Kestrel", description: "SpaceX Kestrel Rocket Engine"),
        .init(name: "Raptor", description: "SpaceX Raptor Rocket Engine"),
        .init(name: "Methox", description: "SpaceX Methox Rocket Engine")
    ]
}

