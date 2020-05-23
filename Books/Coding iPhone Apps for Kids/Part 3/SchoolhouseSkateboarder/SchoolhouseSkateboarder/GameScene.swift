//
//  GameScene.swift
//  SchoolhouseSkateboarder
//
//  Created by Artsiom Sakratar on 5/19/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import SpriteKit

/// Эта структура содержит различные физиские категории, и мы можем определить, какие объекты сталкиваются или контактирют друг с другом
struct PhysicsCategory {
    static let skater: UInt32 = 0x1 << 0
    static let brick: UInt32 = 0x1 << 1
    static let gem: UInt32 = 0x1 << 2
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // Enum для положения секции по Y
    // Секции на земле низкие, а секции на верхней платформе высокие
    enum BrickLevel: CGFloat {
        case low = 0.0
        case high = 100.0
    }
    
    // Определяет состояния, в которых может находится игра
    enum GameState {
        case notRunning
        case running
    }
    
    var bricks = [SKSpriteNode]() // Массив, содержащий все текущие секции тротуара
    var brickSize = CGSize.zero // Размер секции тротуара
    var brickLevel = BrickLevel.low // Текущий уровень определяет положение по оси Y для новых секций
    
    var gameState = GameState.notRunning // Отслеживает текущее состояние игры
    
    var gems = [SKSpriteNode]() // Массив, содержащий все активные алмазы
    
    var scrollSpeed: CGFloat = 5.0 // Скорость движения игры
    let startingScrollSpeed: CGFloat = 5.0 // Хранит начальную скорость
    let gravitySpeed: CGFloat = 1.5 // Константа для гравитации
    
    // Свойства для отслеживания результата
    var score: Int = 0
    var highScore: Int = 0
    var lastScoreUpdateTime: TimeInterval = 0.0
    
    var lastUpdateTime: TimeInterval? // Время последнего вызова для метода обновления
    
    // Создание персонажа ,конструктор унаследован от SKSpriteNode (см. создание background)
    let skater = Skater(imageNamed: "skater")
    
    // метод настройки игры вызывается один раз при запуске
    override func didMove(to view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -6.0) // Задает направление гравитации
        physicsWorld.contactDelegate = self
        
        // anchorPoint — точка привязки, опредиляющая как и где будут позиционироваться спрайти в сцене
        // Устанавливает точку привязки сцены на нижний левый угол (0, 0)
        anchorPoint = CGPoint.zero
        
        let background = SKSpriteNode(imageNamed: "background") // Создает спрайт фона из каталога ресурсов (Assets), imageNamed соответствует названию файла в Assets
        // Frame — свойство GameScene, это объект CGRect представляющий всю сцену
        let xMid = frame.midX // Сохраняется значение центра сцены по оси X
        let yMid = frame.midY // Сохраняется значение центра сцены по оси Y
        background.position = CGPoint(x: xMid, y: yMid) // Задается положение фонового изображения относительно центра сцены
        addChild(background) // Добавляется фоновое изображение к сцене (делая его дочерним объектом сцены)
        
        // Настройка свойств персонажа и добавление его в сцену
        skater.setupPhysicsBody()
        addChild(skater)
        
        setupLabels() // Добавляет надписи
        
        // Добавляем расвознаватель нажатия, чтобы знать, когда пользователь нажмет на экран
        let tapMethod = #selector(GameScene.handleTap(tapGesture:))
        let tapGesture = UITapGestureRecognizer(target: self, action: tapMethod)
        view.addGestureRecognizer(tapGesture)
        
        // Добавляем слой меню с текстом "Нажмите, чтобы играть"
        let menuBackgroundColor = UIColor.black.withAlphaComponent(0.4)
        let menuLayer = MenuLayer(color: menuBackgroundColor, size: frame.size)
        menuLayer.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        menuLayer.position = CGPoint(x: 0.0, y: 0.0)
        menuLayer.zPosition = 30
        menuLayer.name = "menuLayer"
        menuLayer.display(message: "Press from start", score: nil)
        addChild(menuLayer)
    }
    
    // Производит базовую настройку для спрайта skater
    func resetSkater() {
        
        // Задается начальное положение персонажа (точка привязки спрайта это его центр)
        let skaterX = frame.midX / 2.0 // Сохроняет положение по X в четверть горизонтали сцены
        let skaterY = skater.frame.height / 2.0 + 64.0 // Сохраняет положение по Y в половину высоты спрайта skater + высота пола
        skater.position = CGPoint(x: skaterX, y: skaterY) // Задается начальное положение согласно значениям по X и Y
        skater.zPosition = 10 // Задается приоритет видимости спрайта
        skater.minimumY = skaterY // Задается минимально возможное положение по Y
        
        // Сброс дополнительных свойств спрайта
        skater.zRotation = 0.0 // Заставит персонажа снова встать, если опрокинется
        skater.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0) // Заставит остановиться во время прыжка или падения
        skater.physicsBody?.angularVelocity = 0.0 // Останавливает вращение
    }
    
    // Создание надписей
    func setupLabels() {
        
        // "Points" в верхнем левом углу
        let scoreTextLabel: SKLabelNode = SKLabelNode(text: "Points ")
        scoreTextLabel.position = CGPoint(x: 14.0, y: frame.size.height - 20.0)
        scoreTextLabel.horizontalAlignmentMode = .left
        scoreTextLabel.fontName = "Courier-Bold"
        scoreTextLabel.fontSize = 14.0
        scoreTextLabel.zPosition = 20
        addChild(scoreTextLabel)
        
        // Набранные очки
        let scoreLabel: SKLabelNode = SKLabelNode(text: "0")
        scoreLabel.position = CGPoint(x: 14.0, y: frame.size.height - 40.0)
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.fontName = "Courier-Bold"
        scoreLabel.fontSize = 18.0
        scoreLabel.name = "scoreLabel"
        scoreLabel.zPosition = 20
        addChild(scoreLabel)
        
        // "Best" в правом верхнем углу
        let highScoreTextLable: SKLabelNode = SKLabelNode(text: "Best")
        highScoreTextLable.position = CGPoint(x: frame.size.width - 14.0, y: frame.size.height - 20.0)
        highScoreTextLable.horizontalAlignmentMode = .right
        highScoreTextLable.fontName = "Courier-Bold"
        highScoreTextLable.fontSize = 14.0
        highScoreTextLable.zPosition = 20
        addChild(highScoreTextLable)
        
        // Максимум набранных очков
        let highScoreLabel: SKLabelNode = SKLabelNode(text: "0")
        highScoreLabel.position = CGPoint(x: frame.size.width - 14.0, y: frame.size.height - 40.0)
        highScoreLabel.horizontalAlignmentMode = .right
        highScoreLabel.fontName = "Courier-Bold"
        highScoreLabel.fontSize = 18.0
        highScoreLabel.name = "highScoreLabel"
        highScoreLabel.zPosition = 20
        addChild(highScoreLabel)
    }
    
    // Обновление надписей
    func updateScoreLabelText() {
        if let scorelabel = childNode(withName: "scoreLabel") as? SKLabelNode {
            scorelabel.text = String(format: "%04d", score)
        }
    }
    
    // Возврощение к начальным условиям при запуске новой игры
    func startGame() {
        
        gameState = .running
        
        resetSkater() // Сброс персонажа
        
        score = 0
        
        // Сброс переменных класса
        scrollSpeed = startingScrollSpeed
        brickLevel = .low
        lastUpdateTime = nil
        
        // Удаление всех спрайтов земли из сцены
        for brick in bricks {
            brick.removeFromParent()
        }
        bricks.removeAll(keepingCapacity: true) // Очистка массива объектов земли
        
        // Очистка алмазов
        for gem in gems {
            removeGem(gem)
        }
    }
    
    func updateHighScoreLabelText() {
        if let highScoreLabel = childNode(withName: "highScoreLabel") as? SKLabelNode {
            highScoreLabel.text = String(format: "%04d", highScore)
        }
    }
    
    func gameOver() {
        
        // По завершению игры проверяем, добился ли игрок нового рекорда
        
        gameState = .notRunning
        
        if score > highScore {
            highScore = score
            updateHighScoreLabelText()
        }
        
        // Показываем надпись "Game over"
        let menuBackgroundColor = UIColor.black.withAlphaComponent(0.4)
        let menuLayer = MenuLayer(color: menuBackgroundColor, size: frame.size)
        menuLayer.anchorPoint = CGPoint.zero
        menuLayer.position = CGPoint.zero
        menuLayer.zPosition = 30
        menuLayer.name = "menuLayer"
        menuLayer.display(message: "Game over!", score: score)
        addChild(menuLayer)
    }
    
    // Создает тротуар
    func spawnBrick(atPosition position: CGPoint) -> SKSpriteNode {
        
        let brick = SKSpriteNode(imageNamed: "sidewalk") // Создается секция тротуара
        brick.position = position // Задается позиция секции
        brick.zPosition = 8 // Задается приоритет видимости
        addChild(brick) // Добавляет секцию к сцене
        
        // Обновляет свойство реальным значением размера созданной секции (размер изображения)
        brickSize = brick.size
        
        // Добавляет созданную секцию в массив
        bricks.append(brick)
        
        // Настройка физического тела секции
        let center = brick.centerRect.origin // Задает центральную точку созданной секции
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size, center: center) // Создает физическое тело и присоединяет его к спрайту brick
        brick.physicsBody?.affectedByGravity = false // На секцию не будет влиять гравитация
        brick.physicsBody?.categoryBitMask = PhysicsCategory.brick // Определяет тип физического объекта
        brick.physicsBody?.collisionBitMask = 0 // Секции не должны сталкиваться с чем-либо еще
        
        // Возвращает созданную секцию
        return brick
    }
    
    // Создает алмазы
    func spawnGem(atPosition position: CGPoint) {
        
        // Создаем спрайт для алмаза и добавляем его к сцене
        let gem = SKSpriteNode(imageNamed: "gem")
        gem.position = position // Позиция передается в метод
        gem.zPosition = 9 // Приоритет видимости
        addChild(gem)
        gem.physicsBody = SKPhysicsBody(rectangleOf: gem.size, center: gem.centerRect.origin)
        gem.physicsBody?.categoryBitMask = PhysicsCategory.gem
        gem.physicsBody?.affectedByGravity = false
        
        gems.append(gem) // Добавляем новый алмаз к массиву
    }
    
    // Удаление алмаза
    func removeGem(_ gem: SKSpriteNode) {
        
        gem.removeFromParent() // Удаление спрайта из сцены
        
        // Удаление алмаза из массива по индексу, если он там есть
        if let gemIndex = gems.firstIndex(of: gem) {
            gems.remove(at: gemIndex)
        }
    }
    
    // Обеспечивает двигающийся пол
    func updateBricks(withScrollAmount currentScrollAmount: CGFloat) {
        
        // Хранит самое большое значение по оси X для всех существующих секций
        // Используется для отслеживания крайней правой позиции, чтобы знать, когда наступит время добавить еще одну секцию с правого края и где именно
        var farthestRightBrickX: CGFloat = 0.0
        
        for brick in bricks {
            
            // Расчитывается новое положение по оси X для спрайта brick
            // Вычитается из значения положения на оси X значение currentScrollAmount
            // Новое значение соответствует новому положению, находящемуся немного левее от текущего положения секции
            let newX = brick.position.x - currentScrollAmount
            
            // Проверяет, оказалось ли новое положение секции за пределами экрана
            // Меньше ли оно чем ширина секции со знаком минус (т.к. секция может быть на экране частично)
            if newX < -brickSize.width {
                
                brick.removeFromParent() // Удаление ненужного спрайта из сцены
                
                // Находит индекст удаляемого спрайта в массиве
                if let brickIndex = bricks.firstIndex(of: brick) {
                    bricks.remove(at: brickIndex) // Удаление ненужного спрайта из массива
                }
                
            } else {
                
                // Для секции, оставшейся на экране, обновляем положение
                brick.position = CGPoint(x: newX, y: brick.position.y)
                
                // Обновляем значение для крайней правой секции
                if brick.position.x > farthestRightBrickX {
                    farthestRightBrickX = brick.position.x
                }
            }
        }
        
        // Обеспечивает постоянное наполнение экрана секциями
        // Работает пока не появятся секции заполняющие экран до правого края
        while farthestRightBrickX < frame.width {
            
            // Рассчитывается новое полжение спрайта
            var brickX = farthestRightBrickX + brickSize.width + 1.0 // Добавляет к текущему значению самой правой секции ширину одной секции + разрыв в 1 пункт (необходим для осуществления эффекта движения)
            let brickY = (brickSize.height / 2.0) + brickLevel.rawValue
            
            // Время от времени оставляет разрывы, через которые герой должен перепрыгнуть
            let randomNumber = arc4random_uniform(99) // случайное число от 0 до 99
            
            if randomNumber < 2 && score > 10 {
                // 2-проентный шанс на то, что у нас возникнет разрыв между секциями после того, как игрок набрал 10 призовых очков
                
                // Ширина разрыва зависит от скорости
                let gap = 20.0 * scrollSpeed
                brickX += gap
                
                // На каждом разрыве добавляем алмаз
                let randomGemYAmount = CGFloat(arc4random_uniform(150)) // Случайное положение для нового алмаза по оси Y
                let newGemY = brickY + skater.size.height + randomGemYAmount // Вычисляет расположение алмаза по оси Y
                let newGemX = brickX - gap / 2.0 // Вычисляет расположение алмаза по оси X
                
                spawnGem(atPosition: CGPoint(x: newGemX, y: newGemY)) // Созжание алмаза согласно по координатам
            } else if randomNumber < 4 && score > 20 {
                // 2-процентный шанс на то6 что уровень секции Y изменится после того, как игрок набрал 20 призовых очков
                
                if brickLevel == .high {
                    brickLevel = .low
                } else if brickLevel == .low {
                    brickLevel = .high
                }
            }
            
            // Добавляем новую секцию и обновляем положение самой правой
            let newBrick = spawnBrick(atPosition: CGPoint(x: brickX, y: brickY))
            farthestRightBrickX = newBrick.position.x
        }
    }
    
    
    // Обеспечивает движение алмазов
    func updateGems(withScrollAmount currentScrollAmount: CGFloat) {
        
        for gem in gems {
            
            // Обновляем положение каждого алмаза
            let thisGemX = gem.position.x - currentScrollAmount
            gem.position = CGPoint(x: thisGemX, y: gem.position.y)
            
            // Удаляем любые алмазы, ушедшие с экрана
            if gem.position.x < 0.0 {
                
                removeGem(gem)
            }
        }
    }
    
    func updateSkater() {
        
        // Определяем, находится ли скейтбордистка на земле
        if let velocityY = skater.physicsBody?.velocity.dy {
            
            if velocityY < -100.0 || velocityY > 100.0 {
                skater.isOnGround = false
            }
        }
        
        // Проверяем, должна ли игра закончиться
        let isOffScreen = skater.position.y < 0.0 || skater.position.x
            < 0.0
        
        let maxRotation = CGFloat(GLKMathDegreesToRadians(85.0))
        let isTippedOver = skater.zRotation > maxRotation || skater.zRotation < -maxRotation
        
        if isOffScreen || isTippedOver {
            gameOver()
        }
    }
    
    // Обновление очков
    func updateScore(withCurrentTime currentTime: TimeInterval) {
        
        // Количество очков игрока увеличивается по мере игры
        // Счет обновляется каждую секунду
        
        let elapsedTime = currentTime - lastScoreUpdateTime
        
        if elapsedTime > 1.0 {
            
            // Увеличивает количество очков
            score += Int(scrollSpeed)
            
            // Присваиваем свойству lastScoreUpdateTime значение текущего времени
            lastScoreUpdateTime = currentTime
            
            updateScoreLabelText()
        }
    }
    
    // Вызывается перед отрисовкой каждого кадра
    override func update(_ currentTime: TimeInterval) {
        
        if gameState != .running {
            return
        }
        
        // Медленно увеличиваем значение scrollSpeed по мере развития игры
        scrollSpeed += 0.01
        
        // Определяем время, прошедшее с момента последнего вызова update
        var elapsedTime: TimeInterval = 0.0
        
        // Проверет, вызвается ли метод первый раз
        // При первом запуске в lastUpdateTime хранится nil
        if let lastTimeStamp = lastUpdateTime {
            elapsedTime = currentTime - lastTimeStamp // Вычисляет время порошедшее после предыдущего вызова update
        }
        
        lastUpdateTime = currentTime // Сохраняет текущее время вне метода
        
        let expectedElapsedTime: TimeInterval = 1.0 / 60.0 // Расчитывает ожидаемую задержку времени между двумя вызовами update
        
        // Расчитываем, насколько далеко должны сдвинутся объекты при данном обновлении
        let scrollAdjustment = CGFloat(elapsedTime / expectedElapsedTime) // Расчитывает корректировку смещения, реально прошедшее время делится на ожидаемое время между вызовами
        let currentScrollAmount = scrollSpeed * scrollAdjustment // Определяет, чему должна равнятся скорость перемещения для очередного обновления
        
        updateBricks(withScrollAmount: currentScrollAmount)
        updateSkater()
        updateGems(withScrollAmount: currentScrollAmount)
        updateScore(withCurrentTime: currentTime)
    }
    
    // Осуществляет логику при нажатии
    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        
        if gameState == .running {
            
            // Персонаж прыгает, если игрок нажимает на экран, пока он находится на земле
            if skater.isOnGround {
                
                skater.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 260.0))
                run(SKAction.playSoundFileNamed("jump.wav", waitForCompletion: false))
            }
        } else {
            // Если игра не запущена, нажатие на экран запускает новую игру
            if let menuLayer: SKSpriteNode = childNode(withName: "menuLayer") as? SKSpriteNode {
                
                menuLayer.removeFromParent()
            }
            startGame()
        }
    }
    
    // MARK: - SKPysicsContactDelegate Methods
    
    // Срабатывает при контакте
    func didBegin(_ contact: SKPhysicsContact) {
        // Проверяем, есть ли контакт между персонажем и секцией
        if contact.bodyA.categoryBitMask == PhysicsCategory.skater && contact.bodyB.categoryBitMask == PhysicsCategory.brick {
            
            if let velocityY = skater.physicsBody?.velocity.dy {
                
                if !skater.isOnGround && velocityY < 100.0 {
                    
                    skater.createSpark()
                }
            }
            
            skater.isOnGround = true
        } else if contact.bodyA.categoryBitMask == PhysicsCategory.skater && contact.bodyB.categoryBitMask == PhysicsCategory.gem {
            
            // Персонаж коснулась алмаза, поэтому мы его убираем
            if let gem = contact.bodyB.node as? SKSpriteNode {
                removeGem(gem)
                
                // Даем игроку 50 очков за собранный алмаз
                score += 50
                updateScoreLabelText()
                
                run(SKAction.playSoundFileNamed("gem.wav", waitForCompletion: false))
            }
        }
    }
}
