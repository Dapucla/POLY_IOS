//
//  ViewController.swift
//  HW_1
//
//  Created by Даниил Алексеев on 26.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView3: UIImageView!
    @IBOutlet weak var diceImageView4: UIImageView!
    
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var deleteDiceButton: UIButton!
    @IBOutlet weak var addDiceButton: UIButton!
    @IBOutlet weak var sumLabel: UILabel!
    
    var counter = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        overrideUserInterfaceStyle = .dark
        
        rollButton.layer.cornerRadius = 25
        addDiceButton.layer.cornerRadius = 25
        deleteDiceButton.layer.cornerRadius = 25
        
        sumLabel.isHidden = true
        diceImageView3.isHidden = true
        diceImageView4.isHidden = true
    }
    

    @IBAction func roll(_ sender: Any) {
        
        let randomDice1 = Int.random(in: 1..<7)
        let randomDice2 = Int.random(in: 1..<7)
        let randomDice3 = Int.random(in: 1..<7)
        let randomDice4 = Int.random(in: 1..<7)
        
        UIView.transition(with: self.diceImageView1,
                          duration: 0.2,
                          options: .transitionFlipFromTop,
                          animations: {
                            self.diceImageView1.image = UIImage(imageLiteralResourceName: "Dice\(randomDice1)")
                          },
                          completion: nil)
        
        UIView.transition(with: self.diceImageView2,
                          duration: 0.2,
                          options: .transitionFlipFromBottom,
                          animations: {
                            self.diceImageView2.image = UIImage(imageLiteralResourceName: "Dice\(randomDice2)")
                          },
                          completion: nil)
        
        UIView.transition(with: self.diceImageView3,
                          duration: 0.2,
                          options: .transitionFlipFromBottom,
                          animations: {
                            self.diceImageView3.image = UIImage(imageLiteralResourceName: "Dice\(randomDice3)")
                          },
                          completion: nil)
        
        UIView.transition(with: self.diceImageView4,
                          duration: 0.2,
                          options: .transitionFlipFromBottom,
                          animations: {
                            self.diceImageView4.image = UIImage(imageLiteralResourceName: "Dice\(randomDice4)")
                          },
                          completion: nil)
    }
    
    
    @IBAction func deleteDice(_ sender: Any) {
        view.viewWithTag(counter)?.isHidden = true
        if counter == 11{
            counter = 11
        } else {
            counter -= 1
        }
    }
    
    @IBAction func addDice(_ sender: Any) {
        view.viewWithTag(counter)?.isHidden = false
        if counter == 13 {
            counter += 0
        } else {
            counter += 1
        }
    }
}
