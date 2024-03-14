//
//  ViewController.swift
//  Table Cells
//
//  Created by Artsiom Sakratar on 6/14/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var tableView: UITableView!
    let computers = [
        ["Name" : "MacBook Air", "Color" : "Silver" ],
        ["Name" : "MacBook Pro", "Color" : "Silver"],
        ["Name" : "iMac", "Color" : "Silver"] ,
        ["Name" : "Маc Mini", "Color" : "Silver"],
        ["Name" : "Маc Pro", "Color" : "Black" ]

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Подключение NameAndColorCell к ViewController
        tableView.register(NameAndColorCell.self, forCellReuseIdentifier: cellTableIdentifier)
        
        // Подключение файла xib к ViewController
        let xib = UINib(nibName: "NameAndColorCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 65
    }

    // MARK: - Table View Data Source Methods
    
    // Устанавливает кол-во ячеек согласно размеру массива
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    // Настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! NameAndColorCell // Создание объекта ячейки как NameAndColorCell
        
        let rowData = computers[indexPath.row] // Сохраняет данные массива по индексу ячейки
        cell.name = rowData["Name"]! // Задает значение имени
        cell.color = rowData["Color"]! // Задает значение цвета
        
        return cell // Возвращает настроеную ячейку
    }
}

