//
//  AppDelegate.swift
//  Core Data Persistence
//
//  Created by Artsiom Sakratar on 8/9/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: URL = {
        // Каталог, который использует приложение для хранения файла Core Data.
        // Этот код использует каталог Documents в каталоге Applicaton Support.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    } ()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // Модель управляемого объекта для приложения.
        // Это свойство является необязательным. Если приложение не сможет найти и загрузить эту модель, то возникает фтальная ошибка.
        let modelURL = Bundle.main.url(forResource: "Core_Data_Persistence", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    } ()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // Диспетчер хранилища для приложения. Эта реализация создает и возвращает диспетчер при условии, что хранилище уже связано с прилжением. Это свойство является необязательным, поскольку существуют формальные условия, при которых создание хранилища невозможно.
        // Создаем дисвпетчер и хранилище.
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = try!self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Сообщение об ошибке
            var dict = [String: Any]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Замените эту реализацию кодом для обработки ошибок.
            // Функция abort() вынуждает приложение создать аварийную запись и прекратить работу. В реальных приложениях эту функуцию использовать не следует, она нужна только на период разработки.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        return coordinator
    } ()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Возвращает контекст управляемого объекта для приложения, который уже связан с диспетчером постоянного хранилища.
        // Это свойство является необязательным, поскольку существуют формальные условия, при которых создание контекста невозможно.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    } ()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

