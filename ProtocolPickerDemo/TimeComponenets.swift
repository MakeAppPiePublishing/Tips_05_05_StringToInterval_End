//
//  TimeComponenets.swift
//  ProtocolPickerDemo
//
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit
protocol TimeComponentsDelegate{
    func didSelect(timeString:String,seconds:TimeInterval)
}
class TimeComponents: NSObject,UIPickerViewDataSource, UIPickerViewDelegate {
    let componentMax = [9,9,0,5,9,0,5,9] // 0 = separator
    var separator = ":"
    var delegate:TimeComponentsDelegate! = nil
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return componentMax.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return componentMax[component] + 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if componentMax[component] == 0{
            return separator
        }
        return String(format:"%i",row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var resultsString = ""
        for index in 0..<componentMax.count{
            let digit = pickerView.selectedRow(inComponent: index)
            if componentMax[index] == 0 {
                resultsString += separator
            } else {
                resultsString += String(format:"%i",digit)
            }
        }
        
        
        delegate.didSelect(timeString: resultsString, seconds: timeInterval(resultsString))
        }
    func timeInterval(_ timeString:String)-> TimeInterval!{
        let multipliers = [3600.0,60.0,1.0]
        var time = 0.0
        var timeComponents = timeString.components(separatedBy: separator)
        if timeComponents.count > multipliers.count {return nil}
        for index in 0..<timeComponents.count{
            guard let timeComponent = TimeInterval(timeComponents[index]) else {return nil}
            time += timeComponent * multipliers[index]
        }
        return time
    }

}
