//
//  ResultViewController.swift
//  BullAndCow
//
//  Created by Алексей Шамрей on 11.07.22.
//

import UIKit

class ResultViewController: UIViewController {
    var ViewController: ViewController?
    @IBOutlet weak var newScore: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
