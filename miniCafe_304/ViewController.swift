//
//  ViewController.swift
//  miniCafe_304
//
//  Created by HARRISON HALL on 9/14/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var foodItems : [String:Double] = [:]
    var cartItems : [String:Double] = [:]
    @IBOutlet weak var addToCartText: UITextField!
    @IBOutlet weak var addedMsg: UILabel!
    @IBOutlet weak var showItemsLabel: UILabel!
    @IBOutlet weak var adminItemText: UITextField!
    @IBOutlet weak var adminPriceText: UITextField!
    @IBOutlet weak var adminRemoveItem: UIButton!
    @IBOutlet weak var adminAddItem: UIButton!
    @IBOutlet weak var exitAdminButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        foodItems["Steak"] = 15.00
        foodItems["Cheese Pizza"] = 8.00
        foodItems["Cheese Burger"] = 10.00
        foodItems["Salad"] = 6.00
        foodItems["Pasta"] = 7.00
        // Do any additional setup after loading the view.
    }
    
    @objc
    func addAdminStuff(){
        adminAddItem.frame = CGRect(x:265, y: 489, width: 129, height: 76 )
        adminRemoveItem.frame = CGRect(x: 238, y: 625, width: 176, height: 61)
        adminItemText.frame = CGRect(x: 196, y: 554, width: 218, height: 35)
        adminPriceText.frame = CGRect(x: 196, y: 596, width: 218, height: 37)
        exitAdminButton.frame = CGRect(x:234, y: 810, width: 176, height: 52 )
        
    }
    
    @objc
    func leaveAdminMode(){
        adminAddItem.frame = CGRect(x:10000, y: 489, width: 129, height: 76 )
        adminRemoveItem.frame = CGRect(x: 10000, y: 625, width: 176, height: 61)
        adminItemText.frame = CGRect(x: 10000, y: 554, width: 218, height: 35)
        adminPriceText.frame = CGRect(x: 10000, y: 596, width: 218, height: 37)
        exitAdminButton.frame = CGRect(x:10000, y: 810, width: 176, height: 52 )
    }
      
    @IBAction func addCartButton(_ sender: Any) {
        // for loop to check if the text has any of the text items
        if foodItems[addToCartText.text!] != nil{
            cartItems[addToCartText.text!] = foodItems[addToCartText.text!]
            addedMsg.text = "Added: \(addToCartText.text!)"
            print(cartItems)
            return
        } else if addToCartText.text != "218406" {
            addedMsg.text = "Error: Invalid item"
            return
        }
        // Admin (key / password is: 218406)
        else {
            addAdminStuff()
        }
    }
 
    @IBAction func showMenuButton(_ sender: Any) {
        var menuFood = ""
        for (key) in foodItems {
             menuFood += "\(key)\n"
           print(menuFood)
        }
        showItemsLabel.text = menuFood
    }
    
    @IBAction func showPricesMenuButton(_ sender: Any) {
        var menuPrice = ""
        for(key, value) in foodItems{
            menuPrice += "\(key) - $\(value)\n"
        }
        showItemsLabel.text = menuPrice

    }
    
    @IBAction func showCartButton(_ sender: Any) {
        var cartStuff = ""
        for(key, value) in cartItems{
            print("Stuff in cartItems:\(cartItems)")
            var totalPrice = 0.00
            cartStuff += "\(key) - $\(value)\n"
            totalPrice += value
            print("Stuff: \(cartStuff), The total:$\(totalPrice))")
            showItemsLabel.text = "\(cartStuff)\nTotal: $\(value)"
        }
        
    }
    
    @IBAction func addItemButton(_ sender: Any) {
        if String(adminItemText.text!) != nil && Double(adminPriceText.text!) != nil  && Double(adminPriceText.text!)! > 0.00{
            foodItems[String(adminItemText.text!)] = Double(adminPriceText.text!)
            print(foodItems)
            addedMsg.text = "Admin Add: \(adminItemText.text): $\(adminPriceText.text)"
        }
            else {
                addedMsg.text = "Error: No valid item or price added"
                return
            }
        }
    // x = 238, y = 625
    @IBAction func adminRemoveButton(_ sender: Any) {
        if String(adminItemText.text!) != "" {
            foodItems[adminItemText.text!] = nil
            print(foodItems)
        }
        else {
            addedMsg.text = "Admin: No valid item to remove"
        }
        
    }
    
    
    @IBAction func removeAllAdminButton(_ sender: Any) {
        leaveAdminMode()
    }
    
    }
    
    
    

