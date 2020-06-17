//
//  NameAndColorCell.swift
//  Table Cells
//
//  Created by Artsiom Sakratar on 6/14/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    
    // Доступ к тексту метки значения имени
    var name: String = "" {
        didSet {
            if (name != oldValue) {
                nameLabel.text = name
            }
        }
    }
    // Доступ к тексту метки значения цвета
    var color: String = "" {
        didSet {
            if (color != oldValue) {
                colorLabel.text = color
            }
        }
    }
    
    // Создаются пустые метки
    var nameLabel: UILabel!
    var colorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // Задает параметры ячейки
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nameLabelRect = CGRect(x: 0, y: 5, width: 70, height: 15) // Задает расположение метки имени
        let nameMarker = UILabel(frame: nameLabelRect) // Создание объекта метки
        nameMarker.textAlignment = NSTextAlignment.right // Задает выравнивание метки
        nameMarker.text = "Name:" // Задает текст метки
        nameMarker.font = UIFont.boldSystemFont(ofSize: 12) // Задает шрифт метки
        contentView.addSubview(nameMarker) // Добавляет созданную метку к представлению
        
        let colorLabelRect = CGRect(x: 0, y: 26, width: 70, height: 15) // Задает расположение метки цвета
        let colorMarker = UILabel(frame: colorLabelRect) // Создание объекта метки
        colorMarker.textAlignment = NSTextAlignment.right // Задает выравнивание метки
        colorMarker.text = "Color:" // Задает текст метки
        colorMarker.font = UIFont.boldSystemFont(ofSize: 12) // Задает шрифт метки
        contentView.addSubview(colorMarker) // Добавляет созданную метку к представлению
        
        let nameValueRect = CGRect(x: 80, y: 5, width: 200, height: 15) // Задает расположение метки значения имени
        nameLabel = UILabel(frame: nameValueRect) // Задает объекту значения имени расположение
        contentView.addSubview(nameLabel) // Добавляет созданную метку к представлению
        
        let colorValueRect = CGRect(x: 80, y: 25, width: 200, height: 15) // Задает расположение метки значения цвета
        colorLabel = UILabel(frame: colorValueRect) // Задает объекту значения цвета расположение
        contentView.addSubview(colorLabel) // Добавляет созданную метку к представлению
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
