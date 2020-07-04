//
//  ContentCell.swift
//  DialogViewer
//
//  Created by Artsiom Sakratar on 6/30/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    var label: UILabel! // Объект лейбла
    var text: String! { // Текст
        get { // Геттер текста
            return label.text // Возвращает текст лейбла
        }
        set(newText) { // Сеттер текста, принимает новый текст
            label.text = newText // Задает новый текст лейблу
            var newLabelFrame = label.frame // Получает размер лейбла
            var newContentFrame = contentView.frame // Получает размер ячейки
            let textSize = ContentCell.sizeForContentString(s: newText, forMaxWidth: maxWidth) // Получает размер для текста
            newLabelFrame.size = textSize // Задает размер лэйбла соответствующий размеру текста
            newContentFrame.size = textSize // Задает размер ячейки соответствующий размеру текста
            label.frame = newLabelFrame // Устанавливает новый размер лейбла
            contentView.frame = newContentFrame // Устнанавлиывет новый размер ячейки
        }
    }
    var maxWidth: CGFloat! // Максимальная ширина
    
    // Формирует и возвращает размер ячейки согласно тексту
    class func sizeForContentString(s: String, forMaxWidth maxWidth: CGFloat) -> CGSize {
        let maxSize = CGSize(width: maxWidth, height: 1000.0) // Получает максимальный размер ячейки
        let opts = NSStringDrawingOptions.usesLineFragmentOrigin // Получает параметр для отрисовки фрагмента строки
        
        let style = NSMutableParagraphStyle() // Объект, который позволяет изменять значения податрибутов в атрибуте стиля абзаца
        style.lineBreakMode = NSLineBreakMode.byCharWrapping // Задает режим перевода строки
        let attributes = [NSAttributedString.Key.font: defaultFont(), NSAttributedString.Key.paragraphStyle: style] // Получает атрибуты для строки
        
        let string = s as NSString // Преобразование в строки в NSString
        let rect = string.boundingRect(with: maxSize, options: opts, attributes: attributes, context: nil) // Получает сформированные ограничивающий прямоюгольник для небходимой строки согласно заданым параметрам
        
        return rect.size // Возвращает размер сформированного прямоугольника
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: self.contentView.bounds) // Создается лейбл на основе размеров ячейки
        label.isOpaque = false // Не прозрачно
        label.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0) // Цвет фона
        label.textColor = UIColor.black // Цвет текста
        label.textAlignment = .center // Выравнивание текста
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body) // Фрифт
        contentView.addSubview(label) // Добавление лейбла к ячейку
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Шрифт по умолчанию
    class func defaultFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    }

}
