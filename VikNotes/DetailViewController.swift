//
//  DetailViewController.swift
//  VikNotes
//
//  Created by Ivana Kolin on 30-10-16.
//  Copyright © 2016 Ivana Kolin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemKeyText: UITextField!
 
    @IBOutlet weak var passwordText: UITextField!
   
    @IBOutlet weak var itemDescriptionText: UITextView!
    
    @IBAction func saveRecord(_ sender: Any) {
    
        if let detail = self.detailItem {
        
           
            detail.setValue( itemKeyText.text , forKey: "itemKey")
     
            detail.setValue( passwordText.text , forKey: "password")
            
            detail.setValue( itemDescriptionText.text , forKey: "itemDescription")
            
            let ad = UIApplication.shared.delegate as! AppDelegate
            let context = ad.persistentContainer.viewContext
            do{
              try  context.save()
                
            }
            catch {
                print("fout")
            }
        }
    }
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            
            if let itemKeyTextBox = self.itemKeyText {
                
                itemKeyTextBox.text = ""
                if let itemKey = detail.itemKey {
                    itemKeyTextBox.text = itemKey
                }

            }
            
            if let passwordTextBox = self.passwordText {
                passwordTextBox.text = ""
                if let password = detail.password {
                    passwordTextBox.text = password
                }
            }

            
            if let itemDescriptionTextBox = self.itemDescriptionText {
                itemDescriptionTextBox.text = ""
                if let itemDescription = detail.itemDescription {
                    itemDescriptionTextBox.text = itemDescription
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

