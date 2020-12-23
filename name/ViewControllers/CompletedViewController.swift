//
//  CompletedViewController.swift
//  ИнвестУчебник
//
//  Created by Павел on 21.12.2020.
//

import UIKit

class DefaultValue {
    //глобальная переменная содержит значение кол-во пройденных курсов
    static var defaultsV = UserDefaults.standard
}

struct DefaultsKey {
    static let keyProgress = "progressArray"
    static let keyCurrentIndex = "currentIndex"
    static let keyAnd = "and"
    static let keyNameLabel = "userLableName"
}

class CompletedViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var incomingValue2 = Int()
    var searchValue = Int()
    var currentIndex = 0
    var progressArray = [Int]()
    var search = 0
    var and = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add()
        
        
        
    }
    
    //переход на центральный экран
    @IBAction func goToMainButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goMain", sender: nil)
    }
    
    //вычисление кол-ва пройденных курсов
    func add() {
        progressArray = defaults.object(forKey: DefaultsKey.keyProgress) as? [Int] ?? [Int]()
        currentIndex = defaults.integer(forKey: DefaultsKey.keyCurrentIndex)
        
        //используем массив с номерами курсов, добавляем номера, если раньше такой курс не был пройден. Если уже был, то массив не изменяется
        for name in progressArray {
            if name == incomingValue2 {
                search = 1
                break
            } else {
                search = 2
            }
        }
        if (search == 2) {
        progressArray.append(incomingValue2)
        // суммирование пройденных курсов для передачи значения на центральный экран
        currentIndex += 1
        search = 0
            
        defaults.setValue(currentIndex, forKey: DefaultsKey.keyCurrentIndex)
        defaults.setValue(progressArray, forKey: DefaultsKey.keyProgress)
        DefaultValue.defaultsV.setValue(currentIndex, forKey: DefaultsKey.keyAnd)
            
        print("Массив стал \(progressArray)")
        print("Посчиталось прохождений тестов \(currentIndex)")
        }
        else if progressArray.count == 0 {
            progressArray.append(incomingValue2)
            currentIndex += 1
            search = 0
            defaults.setValue(progressArray, forKey: DefaultsKey.keyProgress)
            defaults.setValue(currentIndex, forKey: DefaultsKey.keyCurrentIndex)
            DefaultValue.defaultsV.setValue(currentIndex, forKey: DefaultsKey.keyAnd)
            print("Массив стал \(progressArray)")
            print("Посчиталось прохождений тестов \(currentIndex)")
            
        }
    }
    
}
