//
//  ViewController.swift
//  tapper extreme
//
//  Created by Umedjoni Sharifzoda on 12/5/15.
//  Copyright © 2015 sharifzoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var maxTaps = 100
    var currentTaps = 0
    var timePassed = 0
    
    var timer = NSTimer()
    
    @IBOutlet var logoImg: UIImageView!
    @IBOutlet var playButtonOutlet: UIButton!
    @IBOutlet var tapsAmount: UITextField!
    @IBOutlet var timeSpent: UILabel!
    
    @IBOutlet var coinButtonOUtlet: UIButton!
    @IBOutlet var labelField: UILabel!
    
    
    
    @IBAction func coinButtonPressed(sender: AnyObject) {
        
        currentTaps++
        updateTapsLabel()
        
        if isGameOver(){

            maxTaps = 0
            tapsAmount.text = nil
            currentTaps = 0
            
            logoImg.hidden = false
            playButtonOutlet.hidden = false
            tapsAmount.hidden = false
            timeSpent.hidden = false
            
            coinButtonOUtlet.hidden = true
            labelField.hidden = true
            
            timer.invalidate()
            timeSpent.text = " You Spent \(timePassed) seconds"
            
            timePassed = 0
        }
        
        
    }
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        
        
        if tapsAmount.text != nil && tapsAmount.text != "" {
            
            logoImg.hidden = true
            playButtonOutlet.hidden = true
            tapsAmount.hidden = true
            timeSpent.hidden = true
            
            coinButtonOUtlet.hidden = false
            labelField.hidden = false
            
            maxTaps = Int(tapsAmount.text!)!
            updateTapsLabel()
            
        }else{
            print("You have a wrong input")
        }
    
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    func result(){
        timePassed++
    }
    
    func updateTapsLabel(){
        
        labelField.text = "\(currentTaps) Taps"
        
    }
    
    func isGameOver () -> Bool {
        if currentTaps >= maxTaps{
            return true
        }
        
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

