//
//  CalendarViewController.swift
//  Group Project
//
//  Created by MacOS on 2021-04-04.
//

import UIKit


class CalendarViewController: UIViewController ,  UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var tableView : UITableView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendar: UICollectionView!
    @IBOutlet var yearLbl : UILabel!
    
    let Months = ["January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var daysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonth = String()
    var numberOfBlanks = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        tableView.dataSource = self;
        calendar.dataSource = self;
        self.tableView.rowHeight = 120;
    }
    
    @IBAction func back(){
        switch currentMonth{
        case "January":
            month = 11
            year -= 1
            load()
            calendar.reloadData()
        default:
            month -= 1
            load()
            calendar.reloadData()
        }
    }
    
    @IBAction func next(){
        switch currentMonth{
        case "December":
            month = 0
            year += 1
            load()
            calendar.reloadData()
        default:
            month += 1
            load()
            calendar.reloadData()
        }
    }
    
    func load(){
        getBlanks();
        currentMonth = Months[month]
        monthLabel.text = currentMonth
        yearLbl.text = String(year)
    }
    
    func getBlanks(){
        numberOfBlanks = getDayOfWeek("\(year)-\(month)-\(day)")!
        if (numberOfBlanks == 0){
            numberOfBlanks = 7
        }
        else{
            numberOfBlanks -= 2
        }
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysInMonths[month] + numberOfBlanks
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DateViewCell
        cell.backgroundColor = .clear
        cell.dateLbl.textColor = .black;
        if cell.isHidden{
            cell.isHidden = false
        }
        cell.dateLbl.text = "\(indexPath.row + 1 - numberOfBlanks)"

        if Int(cell.dateLbl.text!)! < 1{
            cell.isHidden = true
        }
        
        if currentMonth == Months[cal.component(.month, from: date)-1] && year == cal.component(.year, from: date) && indexPath.row == day + numberOfBlanks - 1 {
            cell.dateLbl.textColor = .red;
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell;
    }

}
