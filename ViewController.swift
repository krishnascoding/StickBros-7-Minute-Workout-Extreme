//
//  ViewController.swift
//  StickBros 7 Minute Workout Extreme
//
//  Created by Krishna Ramachandran on 4/29/15.
//  Copyright (c) 2015 Krishna Ramachandran. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    @IBAction func startWorkoutButton(sender: AnyObject) {
        
        playVideo()
        
    }
    
// movie player function to playVideo()
  
    var moviePlayer :
    MPMoviePlayerController?
    
    func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("StickBros-7-minute-workout-extreme-640x480", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            player.prepareToPlay()
            player.scalingMode = .AspectFit
            player.controlStyle = .Fullscreen
            self.view.addSubview(player.view)
        }
    }
    
    
// function to see if movie is finished and go back to app home screen
    func movieFinished() {
        moviePlayer!.view.removeFromSuperview()
        NSNotificationCenter.defaultCenter().removeObserver(self, name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
    }
    
    
    // Lock app in portrait. Still need to figure out how to allow landscape only when video is playing
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    override func shouldAutorotate() -> Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // func movieFinished() to see that movie is finished and go back to Start Screen
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "movieFinished", name:
            MPMoviePlayerPlaybackDidFinishNotification, object: nil)
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

