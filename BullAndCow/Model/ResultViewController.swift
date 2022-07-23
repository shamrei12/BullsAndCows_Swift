//
//  ResultViewController.swift
//  BullAndCow
//
//  Created by Алексей Шамрей on 11.07.22.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var globalScore: UILabel?
    @IBOutlet weak var newScore: UILabel?
    @IBOutlet weak var computerNumber: UILabel?
    
    var count: Int = 0
    var recordCount: Int? = 0
    var minutes: Int = 0
    var seconds: Int = 0
    var recordMinutes: Int? = 0
    var recordSeconds: Int? = 0
    var number: String = ""
    
    
    func createResult() -> String {
        if minutes < 10 && seconds < 10 {
            return "\(count) Ходов\n 0\(minutes):0\(seconds)"
        }
        else if minutes < 10 && seconds >= 10 {
            return "\(count) Ходов\n 0\(minutes):\(seconds)"
        }
        else if minutes >= 10 && seconds < 10 {
            return "\(count) Ходов\n \(minutes):0\(seconds)"
        }
        return "\(count) Ходов\n \(minutes):\(seconds)"
    }
    
    func createGlobalResult() -> String {
        if recordMinutes! < 10 && recordSeconds! < 10 {
            return "\(recordCount!) Ходов\n 0\(recordMinutes!):0\(recordSeconds!)"
        }
        else if recordMinutes! < 10 && recordSeconds! >= 10 {
            return "\(recordCount!) Ходов\n 0\(recordMinutes!):\(recordSeconds!)"
        }
        else if recordMinutes! >= 10 && recordSeconds! < 10 {
            return "\(recordCount!) Ходов\n \(recordMinutes!):0\(recordSeconds!)"
        }
        return "\(recordCount!) Ходов\n \(recordMinutes!):\(recordSeconds!)"
    }
    
    func presentCount() {
        newScore?.text = createResult()
        globalScore?.text = createGlobalResult()
        computerNumber?.text = "\(number)"
    }
    //    func presentCount() {
    //        newScore?.text = String(count) + " Ходов" + String(minutes) + ":" + String(seconds)
    //        globalScore?.text = String(recordCount!) + " Ходов" + String(recordMinutes!) + ":" + String(recordSeconds!)
    //    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presentCount()
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}


