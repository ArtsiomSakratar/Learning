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
    
    // Формирование ячейки для каждого ряда
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIndentifier) // Сохраняет доступную запасную ячейку
        
        // Если запасных ячеек нет
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: simpleTableIndentifier) // Создается новая ячейка
        }
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
        
        cell?.textLabel?.text = dwarves[indexPath.row] // Задает тексту ячейки значение массива
        tableView.rowHeight = 70
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        return cell! // Возвращает сформированную ячейку
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70
    }
    
    // MARK: - Table View delegate Methods
    
    // Задает уровень отступа для каждой строки на основе ее номера
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return nil
        } else if (indexPath.row % 2 == 0) {
            return IndexPath(row: indexPath.row + 1, section: indexPath.section)
        } else {
            return indexPath
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I Did", style: .default, handler: nil)
        
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
}

