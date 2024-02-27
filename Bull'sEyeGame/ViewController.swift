//
//  ViewController.swift
//  Bull'sEyeGame
//
//  Created by Yiğit Tilki on 27.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lbTarget: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbRound: UILabel!
    var currentValue: Int = 0
    var targetValue: Int = 0
    var round = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    func startOver(){
        round = 1
        score = 0
        lbTarget.text = "\(targetValue)"
        lbRound.text = "\(round)"
        lbScore.text = "\(score)"
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        lbTarget.text = "\(targetValue)"
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    func updateLabels(){
        lbTarget.text = "\(targetValue)"
        lbRound.text = "\(round)"
        lbScore.text = "\(score)"
    }
    @IBAction func showAlert(){
        let diff = abs(currentValue - targetValue)
        let point = 100 - diff
        let title : String
        if(diff == 0){
            title = "Perfect"
        }
        else if(diff < 5){
            title = "You Almost done it"
        }
        else if(diff < 10){
            title = "Pretty Good"
        }
        else {
            title = "Not Even Close..."
        }
        score += point
    
        let message  = "Your score is: \(point)"
        let alert = UIAlertController(title: "Your Shoot is \(Int(slider.value))", message: message,preferredStyle: .alert)
        let action = UIAlertAction(title: title, style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        print("Hit me clicked")
        startNewRound()
    }

    @IBAction func startOverButton(_ sender: UIButton) {
        startOver()
    }
    @IBAction func sliderMoved(_ slider:UISlider) {
        print("The value of slider is now:\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
}

