//
//  ViewController.swift
//  BullAndCow
//
//  Created by Алексей Шамрей on 8.05.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outNumberScreen: UITextView!
    @IBOutlet weak var numberScreen: UILabel!
    
    var computerNumber:[Int] = []
    var count: Int = 0
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(count: count)
        computerNumber = game.makeNumber()
    }
    
    func сomparingNumber(_ userSent: String) -> String {
        let userNumber = Array(userSent).map{Int(String($0))!}
        if game.uniqueNumber(userNumber) {
            let (bull, cow) = game.comparisonNumber(userNumber, computerNumber)
            return preparingResult(bull, cow, userSent)
        } else {
            return "Некорректное число"
        }
        
    }
    
    @IBAction func buttonsNumber(_ sender: UIButton) {
        if numberScreen.text!.count < 4 {
            numberScreen.text = numberScreen.text! + String(sender.tag)
        }
    }
    
    @IBAction func Clear(_ sender: UIButton) {
        if sender.tag == 10 {
            numberScreen.text = ""
        }
    }
    
    @IBAction func Send(_ sender: UIButton){
        lazy var result = сomparingNumber(numberScreen.text!)
        let user = numberScreen.text!
        if sender.tag == 11 && user.count == 4 {
            outNumberScreen.text = outNumberScreen.text! + "\n\(result)"
            numberScreen.text = ""
        } else {
            numberScreen.text = ""
        }
    }
    
    func restartGame() {
        outNumberScreen.text = nil
        computerNumber = game.makeNumber()
        game.count = 0
    }
    
    //функция формирующая результат поиска числа
    func preparingResult(_ bull: Int,_ cow: Int,_ userNumber: String) -> String {
        if bull == 4 {
            game.count += 1
            count = game.count
            showResult()
//            gameNotification()
            self.restartGame()

            return "\(userNumber) - \(bull) бык \(cow) коров\n Игра окончена"
        } else {
            game.count += 1
            return "\(userNumber) - \(bull) бык \(cow) коров"
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }


//    func gameNotification () {
//        let alert = UIAlertController(
//            title: "Игра окончена",
//            message: "Вы угадали число за \(game.count) попыток",
//            preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Начать заново",
//                                      style: .default,
//                                      handler: { _ in
//            self.restartGame()
//        }))
//
//        self.present(alert, animated: true, completion: nil)
//    }
    

    
    func showResult() {
        // загрузка Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // загрузка View Controller и его сцены со Storyboard
        let viewController = storyboard.instantiateViewController(identifier:
        "ResultViewController")
        viewController.modalPresentationStyle = .fullScreen
        // отображение сцены на экране
        self.present(viewController, animated: true, completion: nil)
    }
}
