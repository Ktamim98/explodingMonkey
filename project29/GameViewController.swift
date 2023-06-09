//
//  GameViewController.swift
//  project29
//
//  Created by Tamim Khan on 31/3/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var currentGame: GameScene!

    @IBOutlet var angleSlider: UISlider!
    @IBOutlet var angleLable: UILabel!
    @IBOutlet var velocitySlider: UISlider!
    @IBOutlet var velocityLabel: UILabel!
    @IBOutlet var launchButton: UIButton!
    @IBOutlet var playerNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .fill
                
                // Present the scene
                view.presentScene(scene)
                
                currentGame = scene as? GameScene
                currentGame.viewController = self
                
                
                angleChanged(angleSlider)
                velocityChanged(velocitySlider)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func angleChanged(_ sender: Any) {
        
        angleLable.text = "Angle: \(Int(angleSlider.value))°"
        
        
    }
    
    
    @IBAction func velocityChanged(_ sender: Any) {
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))"
    }
    
    
    @IBAction func launch(_ sender: Any) {
        angleSlider.isHidden = true
        angleLable.isHidden = true
        
        
        velocitySlider.isHidden = true
        velocityLabel.isHidden = true
        
        launchButton.isHidden = true
        
        currentGame.launch(angle: Int(angleSlider.value), velocity: Int(velocitySlider.value))
        
    }
    
    
    func activePlayer(number: Int){
        if number == 1{
            playerNumber.text = "<<< PLAYER ONE"
        }else{
            playerNumber.text = "PLAYER TWO>>>"
        }
        
        angleSlider.isHidden = false
        angleLable.isHidden = false
        
        
        velocitySlider.isHidden = false
        velocityLabel.isHidden = false
        
        launchButton.isHidden = false
    }
    
    
}
