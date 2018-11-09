//
//  SecondViewController.swift
//  ProtocolPickerDemo
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit

class SecondViewController: UIViewController, TimeComponentsDelegate{
    func didSelect(timeString: String, seconds: TimeInterval) {
        self.title = String(format:"%6.0f seconds",seconds)
    }
    

    @IBOutlet weak var picker: UIPickerView!
    
    let timeComponents = TimeComponents()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = timeComponents
        picker.dataSource = timeComponents
        timeComponents.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
