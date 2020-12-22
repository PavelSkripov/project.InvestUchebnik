//
//  PageViewController.swift
//  ИнвестУчебник
//
//  Created by Павел on 13.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PageViewController: UIViewController {
    
    @IBOutlet weak var topTitle: UILabel!
    
    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var topSubtitle: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    var value = Int ()
    
    var text1: String = "TEXT"
    
    var text2: String = "TEXT"
    
    var text3: String = "TEXT"
//ссылка по номеру нажатой ячейки для установки изображения в ImageView
    var pictureLink: String = "Link"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //прием данных с предыдущего экрана
        textView?.text = text1
        topTitle?.text = text2
        topSubtitle?.text = text3
        
    //установка изображения в ImageView
        topImage.downloadedFrom(link: pictureLink)
    }
    
    //передача номера нажатой ячейки из центрального экрана
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "openQuiz" else { return }
            guard let vc = segue.destination as? QuizViewController else { return }
            vc.incomingValue = value
        }
    //переход на экран с тестом
    @IBAction func openQuizButton(_ sender: Any) {
        self.performSegue(withIdentifier: "openQuiz", sender: nil)
    }
}
