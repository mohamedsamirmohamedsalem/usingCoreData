//
//  ViewController.swift
//  usingCoreData
//
//  Created by Mohamed Samir on 8/25/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var idTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    @IBAction func insertt(_ sender: UIButton) {
        let prod = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context) as! Product
        
        prod.name = nameTF.text ?? ""
        prod.price = Double(priceTF.text ?? "0.0") ?? 0.0
        prod.id = Int32(idTF.text ?? "0") ?? 0
        
        do {
            context.insert(prod)
            print("data has been inserted")
            try context.save()
        } catch  {
            error.localizedDescription
        }
        
        
    }
    @IBAction func selectt(_ sender: UIButton) {
        let FR : NSFetchRequest = Product.fetchRequest()
        do {
            let products = try context.fetch(FR)
            for i in products {
                print(i.name)
                print(i.price)
                print(i.id)
            }
        } catch  {
            error.localizedDescription
        }
    }
    
    @IBAction func updatet(_ sender: UIButton) {
        let FR : NSFetchRequest = Product.fetchRequest()
        let pred = NSPredicate(format: "name='shipsi")
        FR.predicate = pred
        do {
            
            let products = try context.fetch(FR)
            for pro in products {
                pro.name = "checken"
                pro.price = 60.0
                //context.insert(pro)
            }
            
            try context.save()
            
        } catch  {
            error.localizedDescription
        }
        
        
        
    }
    
    @IBAction func deletet(_ sender: UIButton) {
        let FR : NSFetchRequest = Product.fetchRequest()
        let pred = NSPredicate(format: "id='5")
        FR.predicate = pred
        do {
            let products = try context.fetch(FR)
            for pro in products {
                context.delete(pro)
            }
            try context.save()
        } catch  {
            error.localizedDescription
        }
        
    }
    @IBAction func deleteAllt(_ sender: UIButton) {
        let FR : NSFetchRequest = Product.fetchRequest()
        do {
            let products = try context.fetch(FR)
            for pro in products {
                context.delete(pro)
            }
            try context.save()
        } catch  {
            error.localizedDescription
        }
        
    }
}

