//
//  PhysicsConstants.swift
//  star-dash
//
//  Created by Lau Rui han on 12/3/24.
//

import Foundation

struct PhysicsConstants {
    struct CollisionCategory {
        static let none: UInt32 = 0
        static let max: UInt32 = 0xFFFFFFFF
        static let player: UInt32 = 0b1 << 0
        static let monster: UInt32 = 0b1 << 1
        static let collectible: UInt32 = 0b1 << 2
        static let obstacle: UInt32 = 0b1 << 3
        static let powerUpBox: UInt32 = 0b1 << 4
        static let wall: UInt32 = 0b1 << 5
        static let floor: UInt32 = 0b1 << 6
        static let hook: UInt32 = 0b1 << 8
        static let homingMissle: UInt32 = 0b1 << 9
    }

    struct CollisionMask {
        static let player = CollisionCategory.max
                            ^ CollisionCategory.player
                            ^ CollisionCategory.collectible
                            ^ CollisionCategory.hook
                            ^ CollisionCategory.powerUpBox
                            ^ CollisionCategory.homingMissle
        static let monster = CollisionCategory.Player
        static let collectible = CollisionCategory.none
        static let obstacle = CollisionCategory.player | CollisionCategory.monster
        static let powerUpBox = CollisionCategory.none
        static let wall = CollisionCategory.player | CollisionCategory.monster
        static let floor = CollisionCategory.player | CollisionCategory.monster
        static let hook = CollisionCategory.max
                            ^ CollisionCategory.collectible
                            ^ CollisionCategory.powerUpBox
                            ^ CollisionCategory.player
                            ^ CollisionCategory.hook
        static let homingMissle = CollisionCategory.none
    }

    struct ContactMask {
        static let player = CollisionCategory.floor | CollisionCategory.collectible | CollisionCategory.powerUpBox |
                            CollisionCategory.homingMissle
        static let monster = CollisionCategory.player
        static let collectible = CollisionCategory.player
        static let obstacle = CollisionCategory.homingMissle
        static let powerUpBox = CollisionCategory.player
        static let wall = CollisionCategory.player
        static let floor = CollisionCategory.player | CollisionCategory.homingMissle
        static let hook = CollisionCategory.obstacle
        static let homingMissle = CollisionCategory.player | CollisionCategory.obstacle | CollisionMask.floor

    }

    struct Dimensions {
        // TODO: determine appropriate size for each
        static let player = CGSize(width: 70, height: 110)
        static let monster = CGSize(width: 100, height: 140)
        static let collectible = CGSize(width: 60, height: 60)
        static let obstacle = CGSize(width: 60, height: 60)
        static let powerUpBox = CGSize(width: 60, height: 60)
        static let wall = CGSize(width: 60, height: 60)
        static let floor = CGSize(width: 300, height: 60)
        static let hook = CGSize(width: 100, height: 100)
        static let powerUp = CGSize(width: 60, height: 60)
        static let homingMissle = CGSize(width: 50, height: 100)
    }

    struct Mass {
        static let player = CGFloat(50)
    }

    static let jumpImpulse = CGVector(dx: 1_000, dy: 7_500)
    static let runVelocity = CGVector(dx: 200, dy: 0)
    static let maxRunVelocity = CGVector(dx: 250, dy: 0)
}
