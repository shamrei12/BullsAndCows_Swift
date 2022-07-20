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
    var ViewController: ViewController?
    var count: Int = 0
    var recordCount: Int? = 0
  
    func presentCount() {
        newScore?.text = String(count) + " Ходов"
        globalScore?.text = String(recordCount!) + " Ходов"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presentCount()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        }
    }
    

