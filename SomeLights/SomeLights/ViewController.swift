//
//  ViewController.swift
//  SomeLights
//
//  Created by Раиль on 01.12.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    Текущий статус бар - отображён
    override var prefersStatusBarHidden: Bool {
        false
    }
    
    /// признак того, что фонарик включен
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Реагируем на нажатие кнопки
    @IBAction func buttonPressed() {
        
        changeValue()
        chengeBackground()
        interactWithLight()
    }
    
    /// Меняем значение флага (признака)
    func changeValue() {
        isOn = !isOn
    }
    
    /// Взаимодействуем со вспышкой на реальном девайсе
    func interactWithLight() {
        
        if let device = AVCaptureDevice.default(for: .video), device.hasTorch {
            do {
                try
                device.lockForConfiguration()
                device.torchMode = isOn ? .on : .off
                device.unlockForConfiguration()
            } catch {
                print(error.localizedDescription)
            }
            
        } else {
            chengeBackground()
        }
    }
    
    /// Меняем фон экрана в зависимости от признака "isOn"
    func chengeBackground() {
        view.backgroundColor = isOn ? .white : .black
    }
}

