//
//  ViewController.swift
//  HowsTheWeather
//
//  Created by Mike Pitre on 9/23/15.
//  Copyright © 2015 Mike Pitre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findWeather(sender: AnyObject) {
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.weather-forecast.com/locations/San-Diego/forecasts/latest")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                
                if websiteArray!.count > 0 {
                    
                    print(websiteArray![1])
                    
                    let weatherArray = websiteArray![1].componentsSeparatedByString("</span></span></span></p><div class=\"forecast-cont\">")
                    
                    if weatherArray.count > 0 {
                    
                    let weatherSummary = weatherArray[0]
                        
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.resultLabel.text = weatherSummary
                        
                    })
                        
                    
                    
                        
                    }
                    
                }
                
                
            }
            
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

