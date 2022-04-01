//
//  ViewController.swift
//  Calculator App
//
//  Created by Shahzaib Mumtaz on 24/02/2022.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var value: UILabel!
    
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var divideMinus: UIButton!
    @IBOutlet weak var percentage: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    var numbersOnScreen = ""
    var previousNumber = ""
    var performOperation = false
    var operation = 0
    
    var val = ""
    var index = 0
    var count = 0
    
    var calculationArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clear.layer.cornerRadius = clear.frame.size.height / 2
        divideMinus.layer.cornerRadius = divideMinus.frame.size.height / 2
        percentage.layer.cornerRadius = percentage.frame.size.height / 2
        divide.layer.cornerRadius = divide.frame.size.height / 2
        multiply.layer.cornerRadius = multiply.frame.size.height / 2
        minus.layer.cornerRadius = minus.frame.size.height / 2
        plus.layer.cornerRadius = plus.frame.size.height / 2
        equal.layer.cornerRadius = equal.frame.size.height / 2
        dot.layer.cornerRadius = dot.frame.size.height / 2
        zero.layer.cornerRadius = zero.frame.size.height / 2
        one.layer.cornerRadius = one.frame.size.height / 2
        two.layer.cornerRadius = two.frame.size.height / 2
        three.layer.cornerRadius = three.frame.size.height / 2
        four.layer.cornerRadius = four.frame.size.height / 2
        five.layer.cornerRadius = five.frame.size.height / 2
        six.layer.cornerRadius = six.frame.size.height / 2
        seven.layer.cornerRadius = seven.frame.size.height / 2
        eight.layer.cornerRadius = eight.frame.size.height / 2
        nine.layer.cornerRadius = nine.frame.size.height / 2
        
        for item in buttonCollection{
            item.frame.height/2
        }
        
        value.text = "0"
        previousNumber = "0"
        numbersOnScreen = "0"
        operation = 0
        
        plus.titleLabel?.textColor = .white
        minus.titleLabel?.textColor = .white
        multiply.titleLabel?.textColor = .white
        divide.titleLabel?.textColor = .white
    }
    
    @IBAction func buttonNumbers(_ sender: UIButton) {
        
        divide.backgroundColor = .orange
        multiply.backgroundColor = .orange
        minus.backgroundColor = .orange
        plus.backgroundColor = .orange
        equal.backgroundColor = .orange
        
        divide.isPointerInteractionEnabled = true
        multiply.isPointerInteractionEnabled = true
        minus.isPointerInteractionEnabled = true
        plus.isPointerInteractionEnabled = true
        equal.isPointerInteractionEnabled = true
        
        plus.titleLabel?.textColor = .white
        minus.titleLabel?.textColor = .white
        multiply.titleLabel?.textColor = .white
        divide.titleLabel?.textColor = .white
        
        if performOperation == true
        {
            value.text = String(sender.tag-1)
            val = value.text ?? "0"
            numbersOnScreen = val
            print("Current Number: \(numbersOnScreen)")
            calculationArray.append(numbersOnScreen)
            
            calculate(previous: previousNumber, screenNumber: numbersOnScreen)
            
            performOperation = false
        }
        
        else
        {
            value.text = ""
            value.text = value.text! + String(sender.tag-1)
            val = value.text ?? "0"
            numbersOnScreen = val
            calculationArray.append(numbersOnScreen)
            print("Current Number: \(numbersOnScreen)")
        }
    }
    
    @IBAction func buttonOperators(_ sender: UIButton) {
        
        if value.text != nil && sender.tag != 11 && sender.tag != 16
        {
            
            if value.text == "-" || value.text == "+" || value.text == "*" || value.text == "/" {
                print("Operater in label")
            }
            
            else
            {
                previousNumber = value.text ?? "0"
                print("Previous: \(previousNumber)")
            }
            
            if sender.tag == 12 // Divide
            {
                value.text = ""
                value.text = "/"
                calculationArray.append(value.text!)
                
                plus.backgroundColor = .orange
                minus.backgroundColor = .orange
                multiply.backgroundColor = .orange
                divide.backgroundColor = .white
                
                plus.titleLabel?.textColor = .white
                minus.titleLabel?.textColor = .white
                multiply.titleLabel?.textColor = .white
                divide.titleLabel?.textColor = .gray
                
            }
            
            else if sender.tag == 13 // Multiply
            {
                value.text = ""
                value.text = "*"
                
                calculationArray.append(value.text!)
                
                plus.backgroundColor = .orange
                minus.backgroundColor = .orange
                multiply.backgroundColor = .white
                divide.backgroundColor = .orange
                
                plus.titleLabel?.textColor = .white
                minus.titleLabel?.textColor = .white
                multiply.titleLabel?.textColor = .gray
                divide.titleLabel?.textColor = .white
            }
            
            else if sender.tag == 14 // Minus
            {
                value.text = ""
                value.text = "-"
                
                calculationArray.append(value.text!)
                
                plus.backgroundColor = .orange
                minus.backgroundColor = .white
                multiply.backgroundColor = .orange
                divide.backgroundColor = .orange
                
                plus.titleLabel?.textColor = .white
                minus.titleLabel?.textColor = .gray
                multiply.titleLabel?.textColor = .white
                divide.titleLabel?.textColor = .white
                
            }
            
            else if sender.tag == 15 // Plus
            {
                value.text = ""
                value.text = "+"
                
                plus.backgroundColor = .white
                minus.backgroundColor = .orange
                multiply.backgroundColor = .orange
                divide.backgroundColor = .orange
                
                plus.titleLabel?.textColor = .gray
                minus.titleLabel?.textColor = .white
                multiply.titleLabel?.textColor = .white
                divide.titleLabel?.textColor = .white
                
                calculationArray.append(value.text!)
            }
            
            operation = sender.tag
            performOperation = true
        }
        
        else if sender.tag == 16 // Equal to
        {
            calculate(previous: previousNumber, screenNumber: numbersOnScreen)
            
            
            
//            for list in calculationArray
//            {
//                if list.contains("/")
//                {
//                    let op = "/";
//                    if let index = calculationArray.firstIndex(of: op) {
//
//                        print("Index of '\(op)' is \(index).")
//
//                        print("--------------------------------------------")
//
//                        if let p = Int(calculationArray[index-1]),
//                           let n = Int(calculationArray[index+1])
//                        {
//                            let total = p/n
//
//                            print("Result Division: \(total)")
//
//                            calculationArray.remove(at: index)
//                            calculationArray.remove(at: index-1)
//                            calculationArray.remove(at: index+1)
//
//                            calculationArray.insert(String(total), at: index+1)
//
//                            print(calculationArray)
//
//                        } else {
//                            print("Error while dividing")
//                        }
//
//                    } else {
//                        print("Element is not present in the array.")
//                    }
                    
                    //                        if list.contains("*")
                    //                        {
                    //                            let op = "*";
                    //                            if let index = calculationArray.firstIndex(of: op) {
                    //
                    //                                print("Index of '\(op)' is \(index).")
                    //
                    //                                print("--------------------------------------------")
                    //
                    //                                if let p = Int(calculationArray[index-1]),
                    //                                   let n = Int(calculationArray[index+1]) {
                    //
                    //                                    let total = p*n
                    //
                    //                                    print("Result Multiplication : \(total)")
                    //
                    //                                } else {
                    //                                    print("Error while multiplying")
                    //                                }
                    //
                    //                            } else {
                    //                                print("Element is not present in the array.")
                    //                            }
                    //
                    //                            if list.contains("+")
                    //                            {
                    //                                let op = "+";
                    //                                if let index = calculationArray.firstIndex(of: op) {
                    //
                    //                                    print("Index of '\(op)' is \(index).")
                    //
                    //                                    print("--------------------------------------------")
                    //
                    //                                    if let p = Int(calculationArray[index-1]),
                    //                                       let n = Int(calculationArray[index+1]) {
                    //
                    //                                        let total = p-n
                    //
                    //                                        print("Result Addition: \(total)")
                    //
                    //                                    } else {
                    //                                        print("Error while Addition")
                    //                                    }
                    //
                    //                                } else {
                    //                                    print("Element is not present in the array.")
                    //                                }
                    //
                    //                                if list.contains("-")
                    //                                {
                    //                                    let op = "-";
                    //                                    if let index = calculationArray.firstIndex(of: op) {
                    //
                    //                                        print("Index of '\(op)' is \(index).")
                    //
                    //                                        print("--------------------------------------------")
                    //
                    //                                        if let p = Int(calculationArray[index-1]),
                    //                                           let n = Int(calculationArray[index+1]) {
                    //
                    //                                            let total = p-n
                    //
                    //                                            print("Result subtracting: \(total)")
                    //
                    //                                        } else {
                    //                                            print("Error while subtracting")
                    //                                        }
                    //
                    //                                    } else {
                    //                                        print("Element is not present in the array.")
                    //                                    }
                    //                                }
                    //                            }
                    //                        }
//                }
//            }
//
//            print("Equal Pressed")
        }
        
    }
    
    func calculate(previous:String, screenNumber:String) {
        
        if operation == 12
        {
            if let p = Int(previousNumber),
               let n = Int(numbersOnScreen) {
                
                let total = p/n
                value.text = String(total)
                
                count = calculationArray.count
                index = count
                
            } else {
                print("Error while Dividing")
            }
        }
        else if operation == 13
        {
            if let p = Int(previousNumber),
               let n = Int(numbersOnScreen) {
                
                let total = p*n
                value.text = String(total)
                
                count = calculationArray.count
                index = count
                
            } else {
                print("Error while Multiplying")
            }
        }
        
        else if operation == 14
        {
            if let p = Int(previousNumber),
               let n = Int(numbersOnScreen) {
                
                let total = p-n
                value.text = String(total)
                
                count = calculationArray.count
                index = count
                
            } else {
                print("Error while Subtracting")
            }
        }
        
        else if operation == 15
        {
            if let p = Int(previousNumber),
               let n = Int(numbersOnScreen) {
                
                let total = p+n
                value.text = String(total)
                
                count = calculationArray.count
                index = count
                
            } else {
                print("Error while Adding")
            }
        }
    }
    
    @IBAction func buttonClearScreen(_ sender: Any)
    {
        divide.isPointerInteractionEnabled = true
        multiply.isPointerInteractionEnabled = true
        minus.isPointerInteractionEnabled = true
        plus.isPointerInteractionEnabled = true
        equal.isPointerInteractionEnabled = true
        
        value.text = "0"
        previousNumber = "0"
        numbersOnScreen = "0"
        operation = 0
        calculationArray.removeAll()
    }
    
    @IBAction func btnback(_ sender: UIButton) {
        
        if index == 0 {
            print("Array Empty")
        }
        else {
            index = index - 1
            value.text = calculationArray[index]
        }
    }
}










