//
//  ViewController.swift
//  weatherDemo
//
//  Created by wangAngelo on 9/4/15.
//  Copyright (c) 2015 angelowang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var temp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: "http://api.k780.com:88/?app=weather.today&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json")!), queue: NSOperationQueue()) { (_ , data , e ) -> Void in
            if e == nil {
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil ) as? NSDictionary {
                    let result  = json.valueForKey("result") as! NSDictionary
                    self.cityName.text = result["citynm"] as? String
                    self.weather.text = result["weather"] as? String
                    self.temp.text = result["temperature"] as? String
                }
            }
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

