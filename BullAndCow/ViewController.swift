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
    @IBOutlet weak var backMenu: UIBarButtonItem!
    @IBOutlet weak var labelStopwatch: UILabel!
    
    var computerNumber:[Int] = []
    var count: Int = 0
    var game: Game!
    var stopwatch = Timer()
    var record = UserDefaults.standard
    var seconds: Int = 0
    var minutes: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(count: count)
        computerNumber = game.makeNumber()
        record.set(nil, forKey: "recordCount")
        record.set(nil, forKey: "recordMinutes")
        record.set(nil, forKey: "recordSeconds")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restartGame()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
    func createTimer() {
        stopwatch = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    @objc func updateTimer() {
        seconds += 1
        if seconds == 60{
            minutes += 1
            seconds = 0
        }
        if minutes < 10 && seconds < 10 {
            labelStopwatch.text = "0\(minutes):0\(seconds)"
        }
        else if minutes < 10 && seconds >= 10 {
            labelStopwatch.text = "0\(minutes):\(seconds)"
        }
        else if minutes >= 10 && seconds < 10 {
            labelStopwatch.text = "\(minutes):0\(seconds)"
        }
        else if minutes >= 10 && seconds >= 10 {
            labelStopwatch.text = "\(minutes):\(seconds)"
        }
       
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
    
    @IBAction func Send(_ sender: UIButton) {
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
        minutes = 0
        seconds = 0
    }
    
    //функция формирующая результат поиска числа
    func preparingResult(_ bull: Int,_ cow: Int,_ userNumber: String) -> String {
        if bull == 4 {
            stopwatch.invalidate()
            game.count += 1
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
    
    func checkRecodTime() {
        if record.object(forKey: "recordMinutes") == nil && record.object(forKey: "recordSeconds") == nil {
            record.set(minutes, forKey: "recordMinutes")
            record.set(seconds, forKey: "recordSeconds")
        }
        else if record.object(forKey: "recordMinutes") as? Int ?? 0 >= minutes {
            if record.object(forKey: "recordSeconds") as? Int ?? 0 > seconds {
                record.set(minutes, forKey: "recordMinutes")
                record.set(seconds, forKey: "recordSeconds")
            }
        }
    }
    
    func checkRecordCount() {
        if record.object(forKey: "recordCount") == nil {
            record.set(game.count, forKey: "recordCount")
        } else if (record.object(forKey: "recordCount") as? Int ?? 0) > game.count {
            record.set(game.count, forKey: "recordCount")
        }
    }
    
    func showResult() {
        checkRecodTime()
        checkRecordCount()
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // загрузка View Controller и его сцены со Storyboard
        guard let resultViewController = storyboard.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else { return }
        resultViewController.modalPresentationStyle = .fullScreen
        resultViewController.count = game.count
        resultViewController.recordCount = record.object(forKey: "recordCount") as? Int ?? 0
        resultViewController.minutes = minutes
        resultViewController.seconds = seconds
        resultViewController.recordMinutes = record.object(forKey: "recordMinutes") as? Int ?? 0
        resultViewController.recordSeconds = record.object(forKey: "recordSeconds") as? Int ?? 0
        // отображение сцены на экране
        self.present(resultViewController, animated: true, completion: nil)
    }

}
