//
//  ViewController.swift
//  DialogViewer
//
//  Created by Artsiom Sakratar on 6/28/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // Массив словарей с данными
    private var sections = [
        ["header": "First Witch",
         "content" : "Hey, when will the three of us meet up later?"],
        ["header" : "Second Witch",
         "content" : "When everything's straightened out."],
        ["header" : "Third Witch",
         "content" : "That'll be just before sunset."],
        ["header" : "First Witch",
         "content" : "Where?"],
        ["header" : "Second Witch",
         "content" : "The dirt patch."],
        ["header" : "Third Witch",
         "content" : "I guess we'll see Mac there."]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Регистрирует класс ячеек контекта для возможности повторного использования ячейки
        self.collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")

        // Устанавливает отступ от верха представления
        var contentInset = collectionView!.contentInset
        contentInset.top = 20
        collectionView!.contentInset = contentInset
        
        // Настройка отступов для разделов
        let layout = collectionView!.collectionViewLayout // Извлекает объект макета из представления коллекции как UICollectionViewLayout
        let flow = layout as! UICollectionViewFlowLayout // Преобразование объекта для доступа к необходимым методам
        flow.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 20) // Задает небходимые параметры для раздела
        
        // Регистрирует класс ячеек заголовка для возможности повторного использования и задает им определенный вид
        self.collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HEADER")
     
        // Настройка размера ячейки заголовка (если не указать, ячейки заголовки не будут отображаться)
        flow.headerReferenceSize = CGSize(width: 100, height: 25)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Находит все слова в секции
    func wordsInSection(section: Int) -> [String] {
        let content = sections[section]["content"] // Находит строку контента которая соответствует номеру секции
        let spaces = NSCharacterSet.whitespacesAndNewlines // Разделители строки
        let words = content?.components(separatedBy: spaces) // Разделяет строку на слова с помощью разделителей
        return words! // Возвращает массив слов строки
    }
    
    // Задает количество секций
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    // Задает количество ячеек в секции
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let words = wordsInSection(section: section) // Получает массив слов соответствующий номеру секции
        return words.count // Задает количество ячеек соответствующее количеству слов
    }

    // Формирует ячейки контента
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let words = wordsInSection(section: indexPath.section) // Получает массив слов для текущей секции
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CONTENT", for: indexPath) as! ContentCell // Создается объект ячейки контента из очереди
        cell.maxWidth = collectionView.bounds.size.width // Задается максимальная ширина ячейки
        cell.text = words[indexPath.row] // Задается текст ячейки
        return cell // Возвращает сформированную ячейку
    }
    
    // Задает размер ячейки
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let words = wordsInSection(section: indexPath.section) // Получает массив слов секции
        let size = ContentCell.sizeForContentString(s: words[indexPath.row], forMaxWidth: collectionView.bounds.size.width) // Создается объект размера для ячейки на основе слова
        return size // Возвращает размер для ячейки
    }
    
    // Формирование ячейки заголовка
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // Если ячейки имеет вид заголовка
        if (kind == UICollectionView.elementKindSectionHeader) {
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HEADER", for: indexPath) as! HeaderCell // Создается объект ячейки заголовка из очереди
            cell.maxWidth = collectionView.bounds.size.width // Задает максимальную ширину ячейки
            cell.text = sections[indexPath.section]["header"] // Задает текст ячейки
            return cell // Возвращает сформированную ячейку
        }
        abort() // Немедленно прекращает работу если вызывется не для той ячейки
    }

}
