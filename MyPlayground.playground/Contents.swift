import Cocoa

var str = "Hello, playground"
print(str)

import SpriteKit


let scene = SKScene()

let size = CGSize(width: 50, height: 50)
let staticNode = SKSpriteNode( color: .red, size: size )
let dynamicNode = SKSpriteNode( color: .blue, size: size )

staticNode.physicsBody = SKPhysicsBody(rectangleOf: size)
staticNode.physicsBody?.isDynamic = false
staticNode.position = CGPoint(x: 250, y: 250)

dynamicNode.physicsBody = SKPhysicsBody(rectangleOf: size)
dynamicNode.position = CGPoint(x: 250, y: 250)

scene.addChild( staticNode )
scene.addChild( dynamicNode )

let spring = SKPhysicsJointSpring.joint(withBodyA: staticNode.physicsBody!, bodyB: dynamicNode.physicsBody!, anchorA: staticNode.position, anchorB: dynamicNode.position)

spring.frequency = 0.5
spring.damping = 0.2

scene.physicsWorld.add(spring)
let move = SKAction.moveBy(x: 0, y: 200, duration: 1)

staticNode.run(move)


