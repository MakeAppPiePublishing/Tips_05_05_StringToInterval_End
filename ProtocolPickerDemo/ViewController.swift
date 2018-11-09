//
//  ViewController.swift
//  ProtocolPickerDemo
//
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit

class ViewController: UIViewController, TimeComponentsDelegate {
    func didSelect(timeString: String, seconds: TimeInterval) {
        self.title = timeString
    }
    
    
    
    @IBOutlet weak var picker: UIPickerView!
   let timeComponents = TimeComponents()
    override func viewDidLoad() {
        super.viewDidLoad()
       picker.delegate = timeComponents
        picker.dataSource = timeComponents
        timeComponents.delegate = self
    }


}

