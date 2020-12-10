//
//  ViewController.swift
//  Matching Game
//
//  Created by Audaris Blades on 11/29/20.
//
import UIKit


class ViewController: UIViewController {
    @IBAction func wrongButton(_ sender: Any) {
        clickedWrong()
        getTopColor()
        getBottomColor()
        if gameStarted == false {
            startTimer()
            gameStarted = true
        }
        
    }
    
    @IBAction func correctButton(_ sender: Any) {
        clickedCorrect()
        getTopColor()
        getBottomColor()
        if gameStarted == false {
            startTimer()
            gameStarted = true
        }
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        resetButtonClicked()
        getTopColor()
        getBottomColor()
        self.timer?.invalidate()
        gameStarted = false
        seconds = 60
        wrongButton.isHidden = false
        correctButton.isHidden = false
        topButton.isHidden = false
        bottomButton.isHidden = false
        GameOverMessage.isHidden = true
        
    }

    @IBOutlet weak var topButton: UILabel!
    
    @IBOutlet weak var bottomButton: UILabel!
    
    @IBOutlet weak var clockLabel: UILabel!
    
    @IBOutlet weak var GameOverMessage: UILabel!
    
    @IBOutlet weak var scoreCount: UILabel!
    
    @IBOutlet weak var wrongButton: UIButton!
    
    @IBOutlet weak var correctButton: UIButton!
    
    var gameStarted = false
    
    var colorArray = ["green", "yellow", "red", "orange", "blue", "brown"]
    
    var UIColorArray: [UIColor] = [.red, .blue, .green, .yellow, .brown, .orange]
    
    var randomUIColor: UIColor!
    
    var randomIndex: Int!
    
    var score = 0 {
        didSet {
            scoreCount.text = String(score)
        }
    }
    
    var timer: Timer?
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    var seconds = 60 {
        didSet {
            clockLabel.text = String(seconds)
            if seconds <= 0 {
                GameOverMessage.isHidden = false
                GameOverMessage.text = "Game Over. Score: \(score)"
                self.timer?.invalidate()
                wrongButton.isHidden = true
                correctButton.isHidden = true
                topButton.isHidden = true
                bottomButton.isHidden = true
                
            }
        }
    }
    
    @objc func fireTimer() {
        seconds -= 1
    }
    func getUIColor() {
        
        randomIndex = Int.random(in: 0...UIColorArray.count - 1)
        randomUIColor = UIColorArray[randomIndex]
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTopColor()
        getBottomColor()
        GameOverMessage.isHidden = true
    }
    
    func getTopColor() {
        getUIColor()
        topButton.text = colorArray[randomIndex]
        
        
    }
    
    func getBottomColor() {
        getUIColor()
        bottomButton.text = colorArray[randomIndex]
        bottomButton.textColor = randomUIColor
    }
    
    func clickedWrong() {
        if topButton.text == "red" && randomUIColor == UIColor.red {
            score -= 100
        } else if topButton.text == "green" && randomUIColor == UIColor.green {
            score -= 100
        } else if topButton.text == "blue" && randomUIColor == UIColor.blue {
            score -= 100
        } else if topButton.text == "yellow" && randomUIColor == UIColor.yellow {
            score -= 100
        } else if topButton.text == "brown" && randomUIColor == UIColor.brown {
            score -= 100
        } else if topButton.text == "orange" && randomUIColor == UIColor.orange {
            score -= 100
        } else {score += 100}
        
        
        
    }
    
    func clickedCorrect() {
        if topButton.text == "red" && randomUIColor == UIColor.red {
            score += 100
        } else if topButton.text == "green" && randomUIColor == UIColor.green {
            score += 100
        } else if topButton.text == "blue" && randomUIColor == UIColor.blue {
            score += 100
        } else if topButton.text == "yellow" && randomUIColor == UIColor.yellow {
            score += 100
        } else if topButton.text == "brown" && randomUIColor == UIColor.brown {
            score += 100
        } else if topButton.text == "orange" && randomUIColor == UIColor.orange {
            score += 100
        } else {score -= 100}
    }
    
    func resetButtonClicked() {
        score = 0
        
    }
    
    
}
