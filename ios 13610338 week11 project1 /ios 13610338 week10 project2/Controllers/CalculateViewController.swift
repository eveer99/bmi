//
//  ViewController.swift
//  ios 13610338 week10 project2
//
//  Created by Wnsr on 19/10/2562 BE.
//  Copyright © 2562 Wnsr. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //Globel Variable คือ ตัวแปรตรงกลางที่ใช้ร่วมกันในคลาส และ function อื่นสามารถเรียกใช้ได้
    //var bmiValueCal = "0"
    
    //เรียกใช้ struct #1 ประกาศตัวแปรชนิด struct
    var calculateBrain = CalculateBrain()
    
    @IBOutlet weak var sliderHeight: UISlider!

    @IBOutlet weak var sliderWeight: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        print(sender.value)
        
        print(String(format: "%0.2f", sender.value))
        
        let height = String(format: "%0.2f", sender.value)
        
        heightLabel.text = "\(height) M."
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        print(sender.value)
        
        let weight = String(format: "%.0f", sender.value)
        
        weightLabel.text = "\(weight) Kg."
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let heightFromUser = sliderHeight.value
        let weightFromUser = sliderWeight.value
        //local variable
        //let bmi = weight / pow(height, 2)
        //print(bmi)
        //calculate.text = "\(bmi)"
        
        //bmiValueCal = String(format: "%.1f", weight / pow(height, 2))
        
        //เรียกใช้ struct #2 เรียกใช้ fucntion ของ struct โดยการส่งค่าที่ต้องการไป
        calculateBrain.calculateBMI(height: heightFromUser, weight: weightFromUser)
        
        //self.performSegue(withIdentifier: "goToResult", sender: self)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    @IBAction func moonPressed(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "goToCredit", sender: self)
        performSegue(withIdentifier: "goToCredit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            //destinationVC.bmiValue = bmiValueCal
            //ชื่อ object.ชื่อตัวแปร = ค่าที่ต้องการsetให้
            
            //เรียกใช้ struct #3 เรียกใช้ fucntion getBMIValue() ส่งกลับมาเป็น String ซึ่งเป็นชนิดเดียวกับที่ .bmiValue ต้องการ
            //รู้ว่าเป็นตัวเดียวกันด้วยชื่อ calculateBrain
            destinationVC.bmiValue = calculateBrain.getBMIValue()
            
            destinationVC.advice = calculateBrain.getAdvice()
            
            destinationVC.color = calculateBrain.getColor()
        }//end if
        
        if segue.identifier == "goToCredit"{
            let creditVC = segue.destination as! CreditViewController
            creditVC.fullname = "Wanisa Sukniworawan"
        }
        
    }//end func prepare
    
}//end class

