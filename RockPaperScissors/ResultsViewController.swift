//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by Deshmukh,Richa on 4/27/16.
//  Copyright © 2016 Richa. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var userChoosenOption: Roshambo!
    var phoneChoosenOption: Roshambo!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var userPickLabel: UILabel!
    @IBOutlet weak var phonePickLabel: UILabel!
    @IBOutlet weak var gameResultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phonePickLabel.text = phoneChoosenOption.rawValue
        userPickLabel.text = userChoosenOption.rawValue
        
        showGameResult()
    }
    
    func showGameResult(){
        var image: UIImage?, text: String = "";
        if(userChoosenOption == phoneChoosenOption){
            image = UIImage(named: "tie")!
            text = "It's a tie"
        }else if(userChoosenOption == Roshambo.Paper){
            if(phoneChoosenOption == Roshambo.Rock){
                image = UIImage(named: "PaperCoversRock")!
                text = "Paper covers Rock. Congrats, you won!!"
            }else if(phoneChoosenOption == Roshambo.Scissors){
                image = UIImage(named: "ScissorsCutPaper")!
                text = "Scissors cut Paper. Sorry, you lost!!"
            }
        }else if(userChoosenOption == Roshambo.Rock){
            if(phoneChoosenOption == Roshambo.Paper){
                image = UIImage(named: "PaperCoversRock")!
                text = "Paper covers Rock. Sorry, you lost!!"
            }else if(phoneChoosenOption == Roshambo.Scissors){
                image = UIImage(named: "RockCrushesScissors")!
                text = "Rock crushes Scissors. Congrats, you won!!"
            }
        }else{
            if(phoneChoosenOption == Roshambo.Paper){
                image = UIImage(named: "ScissorsCutPaper")!
                text = "Scissors cut Paper. Congrats, you won!!"
            }else if(phoneChoosenOption == Roshambo.Rock){
                image = UIImage(named: "RockCrushesScissors")!
                text = "Rock crushes Scissors. Sorry, you lost!!"
            }
        }
        gameResultLabel.text = text
        imageView.image = image
        
    }
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
