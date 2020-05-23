//
//  Skater.swift
//  SchoolhouseSkateboarder
//
//  Created by Artsiom Sakratar on 5/19/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import SpriteKit

class Skater: SKSpriteNode {
    
    var velocity = CGPoint.zero // Скорость (регулируется осями X, Y)
    var minimumY: CGFloat = 0.0 // Уровень земли по Y
    var jumpSpeed: CGFloat = 20.0 // Скорость прыжка
    var isOnGround = true // Нахождение на земле
    
    func setupPhysicsBody() {
        
        // Проверка на сущуствовании текстуры
        // texture — опционал SKSpriteNode
        if let skaterTexture = texture {
            physicsBody = SKPhysicsBody(texture: skaterTexture, size: size) // Создание физического тела на основе текстуры
            physicsBody?.isDynamic = true // Движение объекта будет управлятся движком
            physicsBody?.density = 6.0 // Плотность
            physicsBody?.allowsRotation = false // Возможность вращатся и поворачиваться
            physicsBody?.angularDamping = 1.0 // Углавая амплитуда описывает, насколько сильно физическтиое тело сопротивляется вращению. Чем больше значение, тем меньше шнасов опрокинуться
            
            physicsBody?.categoryBitMask = PhysicsCategory.skater // Задается тип созданного физического тела
            physicsBody?.collisionBitMask = PhysicsCategory.brick // Задается тип с которым происходит столкновение
            physicsBody?.contactTestBitMask = PhysicsCategory.brick | PhysicsCategory.gem // Задаеются типы с которыми возможен какой-либо контакт
        }
    }
    
    func createSpark() {
        
        // Находим файл эмиттера искр в проекте
        let bundle = Bundle.main
        if let sparkPath = bundle.path(forResource: "Sparks", ofType: "sks") {
            
            // Создаем узел эммитера искр
            let sparksNode = NSKeyedUnarchiver.unarchiveObject(withFile: sparkPath) as! SKEmitterNode
            sparksNode.position = CGPoint(x: 0.0, y: -50.0)
            addChild(sparksNode)
            
            // Производим действие, ждем полсекунды, а затем удаляем эмиттер
            let waitAction = SKAction.wait(forDuration: 0.5)
            let removeAction = SKAction.removeFromParent()
            let waitThenRemove = SKAction.sequence([waitAction, removeAction])
            sparksNode.run(waitThenRemove)
        }
    }
}
