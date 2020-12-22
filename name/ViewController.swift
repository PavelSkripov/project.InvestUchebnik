//
//  ViewController.swift
//  ИнвестУчебник
//
//  Created by Павел on 12.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let defaults = UserDefaults.standard
    
    var incomingValue3 = Int ()
    
    var userLableName: String = "Name"
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var list: UITableView!
    
    var imageView = UIImageView ()
    
    //массив будущих элементов для сохраниения из JSON
    private var feeds: [Feed] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibs : Array = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)!
            let cell: TableViewCell = nibs[0] as! TableViewCell
        cell.setFeed(feed: feeds[indexPath.row])
        
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //передача не следующий экран информации из распарсенного JSON, по нажатию на соответствующую ячейку
        let vc = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
        vc.text1 = feeds[indexPath.row].bigText
        vc.text2 = feeds[indexPath.row].subtitle
        vc.text3 = feeds[indexPath.row].subtitle2
        vc.value = indexPath.row
        vc.pictureLink = feeds[indexPath.row].picture
        navigationController?.pushViewController(vc, animated: true)
        print("goLesson")
        }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //установка имени пользователя в лайбл
        defaults.setValue(userLableName, forKey: "userLableName")
        nameLabel?.text = defaults.string(forKey: "userLableName")
        
        welcomeName()
        
        //установка значения прогресса в лейбл
        incomingValue3 = DefaultValue.defaultsV.integer(forKey: "forBeginValue")
        progressLabel.text = "вы прошли \(incomingValue3) уроков из 9"
        
        print("пришло с комплита \(incomingValue3)")
        
        //парсинг JSON с сервера
               let url = URL(string: "https://newinvestuchebnik2-default-rtdb.firebaseio.com/feed.json")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {data, response, error in
            if (error != nil) {
                print("Server error is", error ?? "unknow")
                return
            }
            print("Server returns: ", String(data: data!, encoding: String.Encoding.utf8) ?? "")
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let responseJSON = responseJSON as? [Any] {
                    print(responseJSON)
                    self.feeds.removeAll()
                    for f in responseJSON {
                        self.feeds.append(Feed(data: f as! [String:Any]))
                    }
                    DispatchQueue.main.async {
                        self.list.reloadData()
                    }
                } else {
                    print("json error")
                }
        }.resume()
    }
    
//кнопка выхода из профиля
    @IBAction func logoutAction(_ sender: Any) {
        do {
                    try Auth.auth().signOut()
                }
             catch let signOutError as NSError {
                    print ("Error signing out", signOutError)
                }
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let initial = storyboard.instantiateInitialViewController()
                UIApplication.shared.keyWindow?.rootViewController = initial
       
    }
    
//функция выдачи имени пользователя из базы
    func welcomeName() {

        if let userId = Auth.auth().currentUser?.uid {

            Firestore.firestore().collection("users").getDocuments() { (snapshot, error) in
            if let currentUserDoc = snapshot?.documents.first(where: { ($0["uid"] as? String) == userId }) {
                let welcomeName = currentUserDoc["firstName"] as! String
               print ( " ВОТ ИМЯ ПОЛЬЗОВАТЕЛЯ - \(welcomeName)")
                self.nameLabel.text = welcomeName
            }
            }
        }
        }
}
