//
//  ViewController.swift
//  CircleView
//
//  Created by hjf on 2017/3/23.
//  Copyright © 2017年 hjf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var detailLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleView.minimumValue = 0
        circleView.maximumValue = 1234
        
        let value1 = InterVal.init(beginValue: 0, endValue: 300, trackColor: UIColor.red)
        let value2 = InterVal.init(beginValue: 300, endValue: 800, trackColor: UIColor.yellow)
        let value3 = InterVal.init(beginValue: 800, endValue: 1234, trackColor: UIColor.blue)
        
        circleView.valus.add(value1)
        circleView.valus.add(value2)
        circleView.valus.add(value3)
        circleView.setNeedsDisplay()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

