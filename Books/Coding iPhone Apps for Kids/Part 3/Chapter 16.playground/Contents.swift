//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

// let ballBody = SKPhysicsBody(circleOfRadius: 30.0)
// let boxBody = SKPhysicsBody(rectangleOf: box.size)
// let skaterBody = SKPhysicsBody(texture: skaterTexture, size: skater.size)
    
let bowlingBall = SKPhysicsBody(circleOfRadius: 10.0)
bowlingBall.mass = 100.0
bowlingBall.friction = 0.3
bowlingBall.restitution = 0.1
bowlingBall.affectedByGravity = true
bowlingBall.allowsRotation = true

let basketball = SKPhysicsBody(circleOfRadius: 10.0)
basketball.mass = 12.0
basketball.friction = 0.5
basketball.restitution = 0.7
basketball.affectedByGravity = true
basketball.allowsRotation = true

let iceCude = SKPhysicsBody(rectangleOf: CGSize(width: 1.0, height: 1.0))
iceCude.mass = 7.0
iceCude.friction = 0.1
iceCude.restitution = 0.2
iceCude.affectedByGravity = true
iceCude.allowsRotation = false

// let cloud = SKPhysicsBody(texture: cloudTexture, size: cloudSize)
// cloud.mass = 1.0
// cloud.friction = 0.0
// cloud.restitution = 0.0
// cloud.affectedByGravity = false
// cloud.allowsRotation = false

