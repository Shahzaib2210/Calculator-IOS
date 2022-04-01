//
//  SecondViewController.swift
//  Calculator App
//
//  Created by Shahzaib Mumtaz on 01/03/2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var list = ["4","/","2","+","5"]
    
    var NewArray = [String]()
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(list)
       
        print("---------------------------------------------------------")
        
        if list.contains("/")
        {
            let op = "/"
            
            if let index = list.firstIndex(of: op)
            {
                print("Index of '\(op)' is \(index).")
                
                print("--------------------------------------------")
                
                if let p = Int(list[index-1]),
                   let n = Int(list[index+1]) {
                    
                    result = p/n
                    
                    print("Result Division: \(result)")
                    
                    list.remove(at: index)
                    list.remove(at: index-1)
                    list.remove(at: index+1)
                    
                    print(list)
                }
                else
                {
                    print("Error while dividing")
                }
            }
            
            else
            {
                print("Element is not present in the array.")
            }
        }
        
//        else if list.contains("*")
//        {
//            let op = "*"
//
//            if let index = list.firstIndex(of: op)
//            {
//                print("Index of '\(op)' is \(index).")
//
//                print("--------------------------------------------")
//
//                if let p = Int(list[index-1]),
//                   let n = Int(list[index+1]) {
//
//                    result = p*n
//
//                    print("Result Multiplying: \(result)")
//                }
//                else
//                {
//                    print("Error while Multiplying")
//                }
//            }
//            else
//            {
//                print("Element is not present in the array.")
//            }
//        }
    }
}
