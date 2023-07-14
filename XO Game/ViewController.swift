//
//  ViewController.swift
//  XO Game
//
//  Created by Muhamed Alkhatib on 20/08/2020.
//

import UIKit

class ViewController: UIViewController {
    
    var player:Int = 1
    var cellsStates:[Int] = [0,0,0,
                             0,0,0,
                             0,0,0]
    var winningCellsStates : [[Int]] = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var winner:Int = 0
    
    @IBOutlet weak var playerWonLabel: UILabel!
    
    @IBOutlet weak var position_0: UIButton!
    @IBOutlet weak var position_1: UIButton!
    @IBOutlet weak var position_2: UIButton!
    @IBOutlet weak var position_3: UIButton!
    @IBOutlet weak var position_4: UIButton!
    @IBOutlet weak var position_5: UIButton!
    @IBOutlet weak var position_6: UIButton!
    @IBOutlet weak var position_7: UIButton!
    @IBOutlet weak var position_8: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cellPressed(_ sender: UIButton) {
        selectPosition(button: sender)
    }
    

    @IBAction func playAgainPressed(_ sender: UIButton) {
        resetGame()
    }
    
    func resetGame(){
        playerWonLabel.text = ""
        position_0.setImage(nil, for: .normal)
        position_1.setImage(nil, for: .normal)
        position_2.setImage(nil, for: .normal)
        position_3.setImage(nil, for: .normal)
        position_4.setImage(nil, for: .normal)
        position_5.setImage(nil, for: .normal)
        position_6.setImage(nil, for: .normal)
        position_7.setImage(nil, for: .normal)
        position_8.setImage(nil, for: .normal)
        for index in 0...8 {
            cellsStates[index] = 0
        }
        winner = 0
    }
    
    func selectPosition(button: UIButton){
        
        if winner == 0{
            if button.image(for: .normal) == nil{
            if player == 1{
                button.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
                button.setImage(UIImage(named: "x3"), for: .normal)
                animateImage(button: button)
                cellsStates[button.tag] = 1
                player = 2
            }else{
                button.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
                button.setImage(UIImage(named: "o2"), for: .normal)
                cellsStates[button.tag] = 2
                animateImage(button: button)
                player = 1
            }
        }
        }
        print(cellsStates)
        selectWinner()
    }
    
    func selectWinner(){
        for positions in winningCellsStates{
            if cellsStates[positions[0]] == 1 && cellsStates[positions[1]] == 1 && cellsStates[positions[2]] == 1{
                winner = 1
                playerWonLabel.text = "Player X Win"
                break
            }
            if cellsStates[positions[0]] == 2 && cellsStates[positions[1]] == 2 && cellsStates[positions[2]] == 2{
                winner = 2
                playerWonLabel.text = "Player O Win"
                break
            }
        }
    }
    func animateImage(button:UIButton){
        UIView.animate(withDuration: 0.5) {
            button.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
        }
          
    
   
    
    
}

