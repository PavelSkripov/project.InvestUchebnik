//
//  QuizViewController.swift
//  ИнвестУчебник
//
//  Created by Павел on 21.12.2020.
//

import UIKit

//кастомный дизайн кнопок
@IBDesignable class PrimaryButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable var border: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
    }
}
}

struct Quiz {
    var question = String()
    var answer = Int()
    var answers = [String]()
}
struct Objects {
    var q1 = [Quiz]()
    var q2 = [Quiz]()
    var q3 = [Quiz]()
}

class QuizViewController: UIViewController {

    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var btn1: PrimaryButton!
    
    @IBOutlet weak var btn2: PrimaryButton!
    
    @IBOutlet weak var btn3: PrimaryButton!
    
    var allLesson = [Objects]()
    var allLesson2 = [Objects]()
    var quizObject = [Quiz]()
    var trueAnswer = Int ()
    var currentQuestion = 0
    var value = Int ()
    var incomingValue = Int ()
    var clr = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //промежуточная структура с данными для теста
        allLesson2 = [
            Objects(q1: [Quiz(question: "Что можно купить на фондовом рынке?", answer:0, answers: ["Облигации, акции", "Только акции специальных фондов", "Опционы, акции, фьючерсы, даже зерно!"])], q2: [Quiz(question: "Как можно заработать на акциях?", answer:2, answers: ["На процентах", "Только на дивидендах", "Дивиденды + может вырасти цена акций"])], q3: [Quiz(question: "Вы считаете, что бизнес конкретной компании будет расти. Что можно купить, чтобы заработать на успехах компании?", answer:1, answers: ["Облигации этой компании", "Акции компании", "Продукцию компании"])])]
        
        //структура с данными для теста
        allLesson = [
            Objects(q1: [Quiz(question: "Что можно купить на фондовом рынке?", answer:0, answers: ["Облигации, акции", "Только акции специальных фондов", "Опционы, акции, фьючерсы, даже зерно!"])], q2: [Quiz(question: "Как можно заработать на акциях?", answer:2, answers: ["На процентах", "Только на дивидендах", "Дивиденды + может вырасти цена акций"])], q3: [Quiz(question: "Вы считаете, что бизнес конкретной компании будет расти. Что можно купить, чтобы заработать на успехах компании?", answer:1, answers: ["Облигации этой компании", "Акции компании", "Продукцию компании"])]),
                     
            Objects(q1: [Quiz(question: "Вы с детства мечтали стать акционером Майкрософт. Доступ к какой бирже вам понадобится, чтобы купить акции?", answer:1, answers: ["К Московской", "К Санкт-Петербургской", "К Американской"])], q2: [Quiz(question: "Вы планируете вкладывать 30 тыс, какой из этих тарифов будет выгодней?", answer:0, answers: ["200 руб абон. платы + 0,05% за сделку", "400 руб абон. платы + 0,02% за сделку","1000 руб абон. платы + 0,005% за сделку"])], q3: [Quiz(question: "В рекламе нового брокера: гарантируют доходность 50% годовых, если открыть счет сегодня. Стоит ли вкладываться", answer:1, answers: ["Конечно! Надо брать", "Нет уж, надо смотреть у проверенных брокеров", "Лучше сохраню деньги под подушкой"])]),
            
            Objects(q1: [Quiz(question: "Что должен сделать владелец облигации, чтобы получить номинал и последний купон в дату погашения?", answer:2, answers: ["Обратиться к эмитенту", "К брокеру", "Ничего. Погашение произойдет автоматически"])], q2: [Quiz(question: "Страхует ли АСВ вложения в облигации", answer:1, answers: ["Да", "Нет","Да, если это облигации российских банков"])], q3: [Quiz(question: "Чтобы снизить риск инвестиций в облигации, нужно:", answer:0, answers: ["Выбирать надежных эмитентов и вкладывать в разных эмитентов", "Покупать самые доходные облигации", "Каждый день следить за ценами и новостями, регулярно торговать облигациями"])]),
            
            Objects(q1: [Quiz(question: "Что можно купить на фондовом рынке?", answer:0, answers: ["Облигации, акции", "Только акции специальных фондов", "Опционы, акции, фьючерсы, даже зерно!"])], q2: [Quiz(question: "Как можно заработать на акциях?", answer:2, answers: ["На процентах", "Только на дивидендах", "Дивиденды + может вырасти цена акций"])], q3: [Quiz(question: "Вы считаете, что бизнес конкретной компании будет расти. Что можно купить, чтобы заработать на успехах компании?", answer:1, answers: ["Облигации этой компании", "Акции компании", "Продукцию компании"])]),
            
            Objects(q1: [Quiz(question: "Что можно купить на фондовом рынке?", answer:0, answers: ["Облигации, акции", "Только акции специальных фондов", "Опционы, акции, фьючерсы, даже зерно!"])], q2: [Quiz(question: "Как можно заработать на акциях?", answer:2, answers: ["На процентах", "Только на дивидендах", "Дивиденды + может вырасти цена акций"])], q3: [Quiz(question: "Вы считаете, что бизнес конкретной компании будет расти. Что можно купить, чтобы заработать на успехах компании?", answer:1, answers: ["Облигации этой компании", "Акции компании", "Продукцию компании"])]),
            
            Objects(q1: [Quiz(question: "Что можно купить на фондовом рынке?", answer:0, answers: ["Облигации, акции", "Только акции специальных фондов", "Опционы, акции, фьючерсы, даже зерно!"])], q2: [Quiz(question: "Как можно заработать на акциях?", answer:2, answers: ["На процентах", "Только на дивидендах", "Дивиденды + может вырасти цена акций"])], q3: [Quiz(question: "Вы считаете, что бизнес конкретной компании будет расти. Что можно купить, чтобы заработать на успехах компании?", answer:1, answers: ["Облигации этой компании", "Акции компании", "Продукцию компании"])]),
            
            Objects(q1: [Quiz(question: "Что можно купить на фондовом рынке?", answer:0, answers: ["Облигации, акции", "Только акции специальных фондов", "Опционы, акции, фьючерсы, даже зерно!"])], q2: [Quiz(question: "Как можно заработать на акциях?", answer:2, answers: ["На процентах", "Только на дивидендах", "Дивиденды + может вырасти цена акций"])], q3: [Quiz(question: "Вы считаете, что бизнес конкретной компании будет расти. Что можно купить, чтобы заработать на успехах компании?", answer:1, answers: ["Облигации этой компании", "Акции компании", "Продукцию компании"])]),
            
            Objects(q1: [Quiz(question: "Что можно купить на фондовом рынке?", answer:0, answers: ["Облигации, акции", "Только акции специальных фондов", "Опционы, акции, фьючерсы, даже зерно!"])], q2: [Quiz(question: "Как можно заработать на акциях?", answer:2, answers: ["На процентах", "Только на дивидендах", "Дивиденды + может вырасти цена акций"])], q3: [Quiz(question: "Вы считаете, что бизнес конкретной компании будет расти. Что можно купить, чтобы заработать на успехах компании?", answer:1, answers: ["Облигации этой компании", "Акции компании", "Продукцию компании"])]),
            
            Objects(q1: [Quiz(question: "Что можно купить на фондовом рынке?", answer:0, answers: ["Облигации, акции", "Только акции специальных фондов", "Опционы, акции, фьючерсы, даже зерно!"])], q2: [Quiz(question: "Как можно заработать на акциях?", answer:2, answers: ["На процентах", "Только на дивидендах", "Дивиденды + может вырасти цена акций"])], q3: [Quiz(question: "Вы считаете, что бизнес конкретной компании будет расти. Что можно купить, чтобы заработать на успехах компании?", answer:1, answers: ["Облигации этой компании", "Акции компании", "Продукцию компании"])])
        ]
        
        //присваивание объекта структуры с данными теста в промежуточную структуру по номеру нажатой ячейка (протянуто значение с центрального экрана)
        allLesson2[0] = allLesson[incomingValue]
    }
  //изначальный вызов функции нового вопроса
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
   //ф-ция выбирает набор данных по номеру нажатой ячейки
    func newQuestion() {
        
        switch currentQuestion {
        case 0:
            quizObject = allLesson2[0].q1
        case 1:
            quizObject = allLesson2[0].q2
        case 2:
            quizObject = allLesson2[0].q3
        default: break
        }
        //установка текста в текстовые поля элементов
        labelQuestion.text = quizObject[0].question
        btn1.setTitle(quizObject[0].answers[0], for: .normal)
        btn2.setTitle(quizObject[0].answers[1], for: .normal)
        btn3.setTitle(quizObject[0].answers[2], for: .normal)
        
        //устанавливаем значение правильного номера ответа
        trueAnswer = quizObject[0].answer
    }
    
    //проверка верного ответа
    func rightOrNot() {
        if (value == trueAnswer) {
            currentQuestion += 1
            clr = 2
            
            let alertController = UIAlertController(title: "Верно!", message: "", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {action in
                self.nextQuestion();
            })
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            clr = 1
            let alertController = UIAlertController(title: "Неправильный ответ", message: "", preferredStyle: .alert)
                 let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                
                  alertController.addAction(defaultAction)
                  self.present(alertController, animated: true, completion: nil)
        }
    }
    
   //ф-ция проверяет показывать ли новый вопрос или закончить тест, исходя из общего числа вопросов
    func nextQuestion() {
        clr = 0
        btn1.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        btn2.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        btn3.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        if (currentQuestion != 3) {
            newQuestion()
            print(currentQuestion)
        }
        else if currentQuestion == 3 {
            endQuiz()
        }
    }
    
    //передача на следующий экран номера нажатой ячейки
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "testCompleted" else { return }
            guard let vc = segue.destination as? CompletedViewController else { return }
            vc.incomingValue2 = incomingValue
        }
    //завершение теста, переход на экран завергения
     func endQuiz() {
        print("Тест завершен")
        currentQuestion = 0
        print("incomingValue = \(incomingValue)")
        self.performSegue(withIdentifier: "testCompleted", sender: nil)
    }
    
    @IBAction func btn1(_ sender: Any) {
        value = 0
        rightOrNot()
        btn2.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        btn3.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        if (clr == 1) {
            btn1.backgroundColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        }
        else if clr == 2 {
            btn1.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        }
    }
    
    @IBAction func btn2(_ sender: Any) {
        value = 1
        rightOrNot()
        btn1.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        btn3.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        if (clr == 1) {
            btn2.backgroundColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        }
        else if clr == 2 {
            btn2.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        }
    }
    
    @IBAction func btn3(_ sender: Any) {
        value = 2
        rightOrNot()
        btn1.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        btn2.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        if (clr == 1) {
            btn3.backgroundColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        }
        else if clr == 2 {
            btn3.backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        }
    }
}
