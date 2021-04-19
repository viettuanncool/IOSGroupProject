//
//  GradeCalculatorViewController.swift
//  Group Project
//
//  Created by Zargham Zahid on 2021-04-19.
//

import UIKit

class GradeCalculatorViewController: UIViewController {
    
    // Grade variables
    @IBOutlet var GradeText1: UITextField!
    @IBOutlet var GradeText2: UITextField!
    @IBOutlet var GradeText3: UITextField!
    @IBOutlet var GradeText4: UITextField!
    @IBOutlet var GradeText5: UITextField!
    
    // Weight variables
    @IBOutlet var WeightText1: UITextField!
    @IBOutlet var WeightText2: UITextField!
    @IBOutlet var WeightText3: UITextField!
    @IBOutlet var WeightText4: UITextField!
    @IBOutlet var WeightText5: UITextField!
    
    @IBOutlet var CurrentGrade: UITextField!
    @IBOutlet var GradeWanted: UITextField!
    @IBOutlet var FinalExam: UITextField!
    @IBOutlet var GradeNeeded: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitCalcGrade(){
        let grade1 = Double(GradeText1.text!)
        let grade2 = Double(GradeText2.text!)
        let grade3 = Double(GradeText3.text!)
        let grade4 = Double(GradeText4.text!)
        let grade5 = Double(GradeText5.text!)
        
        let weight1 = Double(WeightText1.text!)
        let weight2 = Double(WeightText2.text!)
        let weight3 = Double(WeightText3.text!)
        let weight4 = Double(WeightText4.text!)
        let weight5 = Double(WeightText5.text!)
        
        let finalgrade1 = grade1! * (weight1!/100)
        let finalgrade2 = grade2! * (weight2!/100)
        let finalgrade3 = grade3! * (weight3!/100)
        let finalgrade4 = grade4! * (weight4!/100)
        let finalgrade5 = grade5! * (weight5!/100)
        
        let currentgrade = (finalgrade1 + finalgrade2 + finalgrade3 + finalgrade4 + finalgrade5)
        
        CurrentGrade.text = String(format: "%.2f", currentgrade)
    }
    
    @IBAction func calcFinalGradeBtn(){
        
        let currentgrade = Double(CurrentGrade.text!)
        let gradewanted = Double(GradeWanted.text!)
        let finalexam = Double(FinalExam.text!)
        
        let gradeNeededOnFinal = ((gradewanted! - currentgrade!) / finalexam!)*100
        
        GradeNeeded.text = String(format: "%.2f", gradeNeededOnFinal)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
