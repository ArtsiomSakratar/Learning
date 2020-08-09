//
//  ViewController.swift
//  Persistence
//
//  Created by Artsiom Sakratar on 8/6/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lineFields: [UITextField]!
    
    fileprivate static let rootKey = "rootKey" // Ключ для шифрования и расшифровки объектов

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = self.dataFileURL() // Получает путь к файлу
        
        // Проверяет существует ли файл по данному пути
        // В path хранится путь в виде строки
        if (FileManager.default.fileExists(atPath: fileURL.path!)) {
            // Создается массив из данных которые находятся в файле
            if let array = NSArray(contentsOf: fileURL as URL) as? [String] {
                // Копирует данные из массива в текстовые поля
                for i in 0..<array.count {
                    lineFields[i].text = array[i]
                }
            }
        }
        
        
        let data = NSMutableData(contentsOf: fileURL as URL)
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data as! Data)
        let fourLines = unarchiver.decodeObject(forKey: ViewController.rootKey) as! FourLines
        unarchiver.finishDecoding()
        if let newLines = fourLines.lines {
            for i in 0..<newLines.count {
                lineFields[i].text = newLines[i]
            }
        }
        
        let app = UIApplication.shared // Получает ссылку на экземпляр приложения
        // Регистрируем на получение уведомления о пере­ ходе приложения в неактивное состояние (в результате либо завершения работы, либо перевода в фоновый режим) текущий ViewController (self) который находится в приложении по ссылке object
        // При получении уведомления типа .didEnterBackgroundNotification будет вызван метод applicationWillResignActive
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(notification:)), name: UIApplication.didEnterBackgroundNotification, object: app)
    }
    
    // Вызывается при изменении состояния приложения
    @objc func applicationWillResignActive(notification: NSNotification) {
        let fileURL = self.dataFileURL() // Получает ссылку на файл
        let fourLines = FourLines()
        // Получает массив строк со значениями текстовых полей из массива объектов TextField приведенных к типу NSArray, с помощью метода values получает значения текстовых полей
        let array = (self.lineFields as NSArray).value(forKey: "text") as! [String]
        fourLines.lines = array
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(fourLines, forKey: ViewController.rootKey)
        archiver.finishEncoding()
        data.write(to: fileURL as URL, atomically: true) // Записывает содержимое массива в файл по ссылке fileURL
    }

    // Формирует путь к файлу с данными (которого может не существовать) текущего приложения
    func dataFileURL() -> NSURL {
        // Получает массив с путем (или путями, если каталогов несколько) к каталогу Documents в домене (области т.е. каталоге) текущего приложения
        // В iOS каждому приложению, по умолчанию, назначается только один каталог Documents
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        var url: NSURL? // Объект для хранения итоговой ссылки
        url = URL(fileURLWithPath: "") as NSURL // Создается пустой путь
        
        do {
            // Пробует добавить к первому элементу массива ссылок на каталог Documents название файла с данными и сохраняет итоговую ссылку
            try url = urls.first!.appendingPathComponent("data.archive") as NSURL
        } catch {
            print("Error is \(error)")
        }
        
        return url! // Возвращает сформированную ссылку на файл с данными текущего приложения
    }
}

