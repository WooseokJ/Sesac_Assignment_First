//
//  ViewController.swift
//  AnniversaryCalc
//
//  Created by useok on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var pickerDate: UIDatePicker!

    
    @IBOutlet var afterdayLabel: [UILabel]!
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "yyyy년 \n M월 dd일" // a hh:mm:ss EEE   오전 시분초 요일
        formatter.locale  = Locale(identifier: "ko")
        addday(selectDate: Date())
        
    }
    
    @IBAction func datePickerSelect(_ sender: UIDatePicker) {
        addday(selectDate: sender.date)
    }
    
    func addday(selectDate: Date) {
        let addDay : [Int] = [100,200,300,400]
        for item in 0..<afterdayLabel.count{
            let day = Calendar.current.date(byAdding: .day, value:addDay[item] , to: selectDate)
            afterdayLabel[item].text = formatter.string(from:day!)
        }
    }
    
}


