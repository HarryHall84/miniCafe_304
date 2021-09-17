//
//  ViewController.swift
//  miniCafe_304
//
//  Created by HARRISON HALL on 9/14/21.
//

import UIKit

class ViewController: UIViewController {
    var foodItems : [String:Int] = [:]
    var cartItems : [String:Int] = [:]
    @IBOutlet weak var addToCartText: UITextField!
    @IBOutlet weak var addedMsg: UILabel!
    @IBOutlet weak var showItemsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodItems["Steak"] = 15
        foodItems["Cheese Pizza"] = 8
        foodItems["Cheese Burger"] = 10
        foodItems["Salad"] = 6
        foodItems["Pasta"] = 7
        // Do any additional setup after loading the view.
    }
  
    @IBAction func addCartButton(_ sender: Any) {
        // for loop to check if the text has any of the text items
        if foodItems[addToCartText.text!] != nil {
            cartItems[addToCartText.text!] = foodItems[addToCartText.text!]
            addedMsg.text = "Added: \(addToCartText.text!)"
            print(cartItems)
            return
        } else {
            addedMsg.text = "Error: Invalid item"
            return
        }
    }
 
    @IBAction func showMenuButton(_ sender: Any) {
        var menu = ""
        for (key) in foodItems {
             menu += "\(key)\n"
           print(menu)
           // showItemsLabel.text = "\(key) - $\(value)\n"
        }
        showItemsLabel.text = menu
    }
    
    @IBAction func showPricesMenuButton(_ sender: Any) {
        var menu ""
        for(key, value) in foodItems{
            menu += "\(key) - $\(value)\n"
        }
        
    }
    
    
    
}

