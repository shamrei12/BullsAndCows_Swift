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
    var recordSeconds: Int? = 0
    var number: String = ""
    
    func createResult() -> String {
        newScore?.font = UIFont(name: "Marker Felt Wide", size: 17)
        let textTime = TimeManager.shared.convertToMinutes(seconds: seconds)
        return "\(count) Ходов\n \(textTime)"
    }
    
    func createGlobalResult() -> String {
        globalScore?.font = UIFont(name: "Marker Felt Wide", size: 17)
        let textTimeRecords = TimeManager.shared.convertToMinutes(seconds: recordSeconds!)
        return "\(recordCount!) Ходов\n \(textTimeRecords)"
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


