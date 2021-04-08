//
//  ViewController.swift
//  StopWatch
//
//  Created by Yajwin Grover on 8/30/20.
//  Copyright © 2020 Yajwin Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var end: UIButton!
    @IBOutlet weak var restart: UIButton!
    @IBOutlet weak var countdown: UIButton!
    
    var seconds = 00;
    var minutes = 00;
    var milliseconds = 00;
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
        
    }
    
    func setUp(){
        
        seconds = 0
        minutes = 0
        //Set up the label in a cool way
        display.layer.masksToBounds = true;
        display.layer.cornerRadius = display.frame.size.height/2.0
        
        //set up the start button
        start.frame.size.width = start.frame.size.height
        start.layer.cornerRadius = start.frame.size.height/2.0
        
        //set up end button
        end.frame.size.width = end.frame.size.height
        end.layer.cornerRadius = end.frame.size.height/2.0
        
        //set up restart button
        
        restart.layer.cornerRadius = restart.frame.size.height/2.0
        
        //set up countdown
        
        
    }
    
    @IBAction func startTime( _ sender: UIButton){
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    
    
    @objc func action(){
        milliseconds += 1
        if(milliseconds == 100){
            seconds += 1
            milliseconds = 0
        }
        if(seconds == 60){
            minutes += 1
            seconds = 00;
        }
        
        if(seconds < 10){
            display.text = String(minutes) + ":" + "0" + String(seconds) + ":" + String(milliseconds)
        }
        else{
            display.text = String(minutes) + ":" + String(seconds) + ":" + String(milliseconds)
        }
        
    }
    
    @IBAction func endTime(_ sender: Any){
        timer.invalidate()
    }
    
    @IBAction func resetTime(_ sender: Any) {
        seconds = 0; minutes = 0
        
        display.text = ""
        
        endTime(self)
    }
    


}

