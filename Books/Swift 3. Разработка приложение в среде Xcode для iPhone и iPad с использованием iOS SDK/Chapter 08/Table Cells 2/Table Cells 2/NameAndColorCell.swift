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
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
