//
//  MoveViewController.swift
//  BullAndCow
//
//  Created by Алексей Шамрей on 22.07.22.
//

import UIKit

class MoveViewController: UIViewController {
    var computerNumber: String = ""
    
    @IBOutlet weak var numberComputer: UILabel!
    @IBOutlet weak var moveResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTextMove()
    }
    
    @IBAction func backResult(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    func makeTextMove() {
        numberComputer.text = computerNumber
    }
}
