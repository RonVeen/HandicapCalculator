//
//  HandicapCalculator.swift
//  HandicapCalculator
//
//  Created by R Veen on 29/09/2019.
//  Copyright © 2019 R Veen. All rights reserved.
//

import Foundation

class HandicapCalculator {
    
    func calculate(currentHandicap: Double, stablefordPoints: Int) -> Double {
        let playCategory = self.determineCatetoryForPlayer(currentHandicap)
        if (isWithinBuffer(playCategory, stablefordPoints)) {
            return currentHandicap
        }
        let difference = stablefordPoints - 36
        var newHandicap = 0.0
        if (difference < 0) {
            newHandicap = increaseHandicap(currentHandicap, score: abs(difference), playCategory)
        } else {
            newHandicap = decreaseHandicap(currentHandicap, score: difference, playCategory)
        }
        
        return newHandicap
    }
    
    internal func determineCatetoryForPlayer(_ currentHandicap: Double)  -> Category {
        let category = categories.first {currentHandicap >= $0.low && currentHandicap <= $0.high}
        return category!
    }
    
    internal func isWithinBuffer(_ category: Category, _ stablefordPoints: Int) -> Bool {
        return stablefordPoints >= category.buffer.low && stablefordPoints <= category.buffer.high
    }

    internal func increaseHandicap(_ current: Double, score difference: Int, _ category: Category) -> Double {
        let newHandicap = current + (Double(difference) * category.increment)
        return newHandicap
    }

    internal func decreaseHandicap(_ current: Double, score difference: Int, _ category: Category) ->Double {
        var newHandicap = current
        var currentCategory = category
        for _ in 1 ... difference {
            newHandicap -= currentCategory.decrement
            currentCategory = determineCatetoryForPlayer(newHandicap)
        }
        return newHandicap
    }
    
}

fileprivate let categories: [Category] = [
    Category(number: 1, low: 0.0,  high: 4.4,  increment: 0.1, decrement: 0.1, buffer: Buffer(low: 35, high: 36)),
    Category(number: 2, low: 4.5,  high: 11.4, increment: 0.1, decrement: 0.2, buffer: Buffer(low: 34, high: 36)),
    Category(number: 3, low: 11.5, high: 18.4, increment: 0.1, decrement: 0.3, buffer: Buffer(low: 33, high: 36)),
    Category(number: 4, low: 18.5, high: 26.4, increment: 0.1, decrement: 0.4, buffer: Buffer(low: 32, high: 36)),
    Category(number: 5, low: 26.5, high: 36.0, increment: 0.1, decrement: 0.5, buffer: Buffer(low: 31, high: 36)),
    Category(number: 6, low: 36.0, high: 54.0, increment: 0.0, decrement: 1.0, buffer: Buffer(low:  0, high:  0))
]


struct Category {
    let number: Int
    let low: Double
    let high: Double
    let increment: Double
    let decrement: Double
    let buffer: Buffer
}

struct Buffer {
    let low: Int;
    let high: Int;
}



