//
//  ViewController.swift
//  stormy 1.5
//
//  Created by Michael Elbaz on 6/7/15.
//  Copyright (c) 2015 elboss-apps. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
            let weatherDictionary = NSDictionary(contentsOfFile: plistPath),
            let currentWeatherDictionary = weatherDictionary["currently"] as? [String: AnyObject] {
                
                let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                
                currentTemperatureLabel?.text = "\(currentWeather.temperature)º"
                currentHumidityLabel?.text = "\(currentWeather.humidity)%"
                currentPrecipitationLabel?.text = "\(currentWeather.precipProbability)%"
                
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

