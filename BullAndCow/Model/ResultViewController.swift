//
//  ResultViewController.swift
//  BullAndCow
//
//  Created by Алексей Шамрей on 11.07.22.
//

import UIKit

class ResultViewController: UIViewController {
    var ViewController: ViewController?
    var count: Int = 0
    @IBOutlet weak var newScore: UILabel?
    func presentCount() {
        newScore?.text = "Ходов " + String(count)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presentCount()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
