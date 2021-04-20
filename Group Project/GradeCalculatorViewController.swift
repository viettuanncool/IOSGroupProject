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
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
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
        
        let weightedgrade = (weight1! + weight2! + weight3! + weight4! + weight5!)
        
        let currentgrade = (grade1! + grade2! + grade3! + grade4! + grade5!)

        
        let finalgrade = ((currentgrade / weightedgrade) * 100)
        
        
        CurrentGrade.text = String(format: "%.2f", finalgrade)
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
