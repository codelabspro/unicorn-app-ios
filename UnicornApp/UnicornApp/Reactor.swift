//
//  Reactor.swift
//  UnicornApp
//
//  Created by Coder on 2022-10-26.
//

import Foundation

struct Reactor: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String

}

extension Reactor {
    static let samples: [Reactor] = [
        .init(name: "ITER", description: "International Thermonuclear Experimental Reactor"),
        .init(name: "JET", description: "Joint European Torus"),
        .init(name: "Tokamak", description: "High Temperature Superconducting Magnets"),
        .init(name: "KSTAR", description: "Korean Superconducting Tokamak Reactor")
    ]
}
