//
//  MasterViewController.swift
//  TinyPix
//
//  Created by Artsiom Sakratar on 20.01.21.
//  Copyright © 2021 Artsiom Sakratar. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {
    @IBOutlet var colorControl: UISegmentedControl!
    private var documentFileURLs: [URL] = []
    private var chosenDocument: TinyPixDocument?
    private var query: NSMetadataQuery!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(MasterViewController.insertNewObject))
        navigationItem.rightBarButtonItem = addButton
        
        let prefs = UserDefaults.standard
        let selectedColorIndex = prefs.integer(forKey: "selectedColorIndex")
        setTintColorForIndex(selectedColorIndex)
        colorControl.selectedSegmentIndex = selectedColorIndex
        
        reloadFiles()
        
        NotificationCenter.default.addObserver(self, selector: #selector(MasterViewController.onSettingsChanged(_:)), name: UserDefaults.didChangeNotification, object: nil)
    }
    
    @objc func onSettingsChanged(_ notification: Notification) {
        let prefs = UserDefaults.standard
        let selectedColorIndex = prefs.integer(forKey: "selectedColorIndex")
        setTintColorForIndex(selectedColorIndex)
        colorControl.selectedSegmentIndex = selectedColorIndex
    }
    
    private func urlForFileName(_ fileName: String) -> URL {
        let fm = FileManager.default
        let baseURL = fm.url(forUbiquityContainerIdentifier: nil)
        let pathURL = try! baseURL?.appendingPathComponent("Documents")
        let destinationURL = try! pathURL?.appendingPathComponent(fileName)
        return destinationURL!
    }
    
    private func reloadFiles() {
        let fileManager = FileManager.default
        
        let cloudURL = fileManager.url(forUbiquityContainerIdentifier: nil)
        print("Got cloudURL \(cloudURL)")
        if cloudURL != nil {
            query = NSMetadataQuery()
            query.predicate = NSPredicate(format: "%K like '*.tinypix'", NSMetadataItemFSNameKey)
            query.searchScopes = [NSMetadataQueryUbiquitousDataScope]
            NotificationCenter.default.addObserver(self, selector: #selector(MasterViewController.updateUbiquitousDocuments(_:)), name: NSNotification.Name.NSMetadataQueryDidFinishGathering, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(MasterViewController.updateUbiquitousDocuments(_:)), name: NSNotification.Name.NSMetadataQueryDidUpdate, object: nil)
            query.start()
        }
    }
    
    @objc func updateUbiquitousDocuments(_ notification: Notification) {
        documentFileURLs = []
        
        print("updateUbiquitousDocuments, results = \(query.results)")
        let results = query.results.sorted { obj1, obj2 in
            let item1 = obj1 as! NSMetadataItem
            let item2 = obj2 as! NSMetadataItem
            let item1Date = item1.value(forAttribute: NSMetadataItemFSCreationDateKey) as! Date
            let item2Date = item2.value(forAttribute: NSMetadataItemFSCreationDateKey) as! Date
            let result = item1Date.compare(item2Date)
            return result == ComparisonResult.orderedAscending
        }
        for item in results as! [NSMetadataItem] {
            let url = item.value(forAttribute: NSMetadataItemURLKey) as! URL
            documentFileURLs.append(url)
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentFileURLs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell")!
        let fileURL = documentFileURLs[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = fileURL.deletingPathExtension().lastPathComponent
        return cell
    }
    
    @IBAction func chooseColor(_ sender: UISegmentedControl) {
        let selectedColorIndex = sender.selectedSegmentIndex
        setTintColorForIndex(selectedColorIndex)
            
        let prefs = UserDefaults.standard
        prefs.set(selectedColorIndex, forKey: "selectedColorIndex")
        prefs.synchronize()
        
        NSUbiquitousKeyValueStore.default.set(Int64(selectedColorIndex), forKey: "selectedColorIndex")
        NSUbiquitousKeyValueStore.default.synchronize()
    }
    
    private func setTintColorForIndex(_ colorIndex: Int) {
        colorControl.tintColor = TinyPixUtils.getTintColorForIndex(colorIndex)
    }
    
    @objc func insertNewObject() {
        let alert = UIAlertController(title: "Choose File Name", message: "Enter a name for your new TinyPix document", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let createAction = UIAlertAction(title: "Create", style: .default) { action in
            let textField = alert.textFields![0] as UITextField
            self.createFileNamed(textField.text!)
        };
        
        alert.addAction(cancelAction)
        alert.addAction(createAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func createFileNamed(_ fileName: String) {
        let trimmedFileName = fileName.trimmingCharacters(
            in: CharacterSet.whitespaces)
         if !trimmedFileName.isEmpty {
            let targetName = trimmedFileName + ".tinypix"
            let saveUrl = urlForFileName(targetName)
            chosenDocument = TinyPixDocument(fileURL: saveUrl)
            chosenDocument?.save(to: saveUrl, for: UIDocument.SaveOperation.forCreating, completionHandler: { success in
                if success {
                    print("Save OK")
                    self.reloadFiles()
                    self.performSegue(withIdentifier: "masterToDetail", sender: self)
                } else {
                    print("Failed to save!")
                }
            })
        }
    }
    
     func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination =
            segue.destination as! UINavigationController
        let detailVC =
            destination.topViewController as! DetailViewController
            
        if sender === self {
            detailVC.detailItem = chosenDocument as? Event
        } else {
            if let indexPath = tableView.indexPathForSelectedRow {
                let docURL = documentFileURLs[(indexPath as NSIndexPath).row]
                chosenDocument = TinyPixDocument(fileURL: docURL)
                chosenDocument?.open() { success in
                    if success {
                        print("Load OK")
                        detailVC.detailItem = self.chosenDocument as? Event
                    } else {
                        print("Failed to load!")
                    }
                }
            }
        }
    }
}


