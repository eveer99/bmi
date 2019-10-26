import UIKit

//UI แปลว่า User Interface ส่วนที่เกี่ยวกับการเชื่อมต่อกับผู้ใช้ เช่นปุ่มกด เป็นต้น
//Kit แปลว่าชุดเครื่องมือ

//Struct จะเป็นแบบ Pass by Value คือ เหมือนcopyแยกกันคนละอัน แก้อันใดอันนึง ไม่มีผลกับอีกอัน
//Class จะเป็นแบบ Pass by Reference คือ เหมือนcopyแยกกันคนละอัน แก้อันใดอันนึง จะมีผลกับอีกอัน

struct CalculateBrain {
    
//    var bmi: Float = 0.0 // 1 value เก็บตัวเดียว
    //ไม่ใช้แล้วเพราะใช้ bmiStruct แทน
    
    var bmiStruct: BMI? // 3 value เก็บสามตัว เป็นชุด (value, advice, color) จากใน BMI.swift
    
    //เครื่องหมายคำถาม ? คือ เป็นตัวแปรชนิด Optional คือตัวเลือกจะมีค่าหรือไม่มีค่าก็เป็นไปได้
    //ดังนั้นมันอาจจะไม่มีค่าก็ได้
    
    func getBMIValue() -> String {
        
//        let bmiTo1DecimalPlace = String(format: "%.1f", bmi)
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmiStruct?.value ?? 0.0) //?? คือ if แบบย่อ
        
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmiStruct?.advice ?? "No Advice"
        
        //if แบบย่อ
        //ตัวแปรที่ต้องการดูค่าว่ามีค่าหรือไม่ ?? ถ้าไม่มีค่าให้ใช้ค่าตรงนี้แทน
        //bmiStruct?.advice ?? "No Advice"
        //ตัวแปรที่ต้องการดูค่าว่ามีค่าหรือไม่ = bmiStruct?.advice
        //
    }
    
    func getColor() -> UIColor {
        return bmiStruct?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateBMI(height:Float, weight:Float){
        
        //bmi ตัวที่ใช้นี่ไม่มี var หรือ let นำหน้าคือตัวที่เป็น globel var
        //weight กับ height คือตัวที่ function รับค่ามาในชื่อนั้นๆ เป็น local var
        
//        bmi = weight / (height*height)
        
        let bmiValueLocal = weight/(height * height)
        
        if bmiValueLocal < 18.5 {
            bmiStruct = BMI(value: bmiValueLocal, advice: "Eat more pies!", color: #colorLiteral(red: 0.59216851, green: 0.7391298413, blue: 0.8755273223, alpha: 1))
        }else if bmiValueLocal < 24.9 {
            bmiStruct = BMI(value: bmiValueLocal, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.3082586229, green: 0.6005610824, blue: 0.3899252117, alpha: 1))
        }else{
            bmiStruct = BMI(value: bmiValueLocal, advice: "Eat less pies!", color: #colorLiteral(red: 0.8342731595, green: 0.3549295068, blue: 0.3291322291, alpha: 1))
        }//end else
        
    }//end func calculate
    
}//end struct calculate
