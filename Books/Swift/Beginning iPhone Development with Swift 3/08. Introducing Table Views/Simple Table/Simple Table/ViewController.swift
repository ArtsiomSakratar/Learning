//
//  ViewController.swift
//  Simple Table
//
//  Created by Artsiom Sakratar on 6/11/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy",
        "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori",
        "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur",
        "Bombur"
    ]
    let simpleTableIndentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table View Data Source Methods
    // Настройка Table View
    
    // Устнавливает колиество строк в таблице равной размеру массива данных
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    // Формирование и настройка ячейки для каждого ряда
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIndentifier) // Сохраняет доступную запасную ячейку
        
        // Если запасных ячеек нет
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: simpleTableIndentifier) // Создается новая ячейка
        }
        
        let image = UIImage(named: "star") // Создается объект изображения звезды
        cell?.imageView?.image = image // Свойству изображения ячейки задается изображение звезды
        let highlightedImage = UIImage(named: "star2") // Создается объект изображения выделеной звезды
        cell?.imageView?.highlightedImage = highlightedImage // Свойству изображения выбранной ячейки задается изображение выделенной зведы
        
        // Если индекс ячейки  меньше 7
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney" // Задается описание с определенным значением
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
        
        cell?.textLabel?.text = dwarves[indexPath.row] // Задает тексту ячейки значение массива
        tableView.rowHeight = 70 // Задает высоту ячейки
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 50) // Задается шрифт ячейки
        return cell! // Возвращает сформированную ячейку
    }
    
    // Устанавливает высоту для каждой ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70 // Для первой ячейки высота 120, остальные — 70
    }
    
    // MARK: - Table View delegate Methods
    
    // Задает уровень отступа для каждой строки на основе ее номера
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    // Срабатывает перед тем как ячейка будет выбрана
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 { // Если первая ячейка
            return nil // Вернется nil, в результате чего ячейку будет выбрать невозможно
        } else if (indexPath.row % 2 == 0) { // Если выбрана ячейка с четным индексом
            return IndexPath(row: indexPath.row + 1, section: indexPath.section) // Вернется новый объект адреса ячейки с индексом ячейки увеличенным на 1, в результате чего будет выбрана следующая ячейка
        } else { // В других случаях
            return indexPath // Будет выбрана текущая ячейка
        }
    }
    
    // Срабатывает когда ячейка выбрана
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row] // Сохраняется значение массива соответствующее индексу ячейки
        let message = "You selected \(rowValue)" // Формируется строка для предупреждения
        
        let controller = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert) // Создается объект предупреждения
        let action = UIAlertAction(title: "Yes I Did", style: .default, handler: nil) // Создается объект действия предупреждения
        
        controller.addAction(action) // Добавляет действие к предупреждению
        present(controller, animated: true, completion: nil) // Предупреждение показывается на экран
    }
}

