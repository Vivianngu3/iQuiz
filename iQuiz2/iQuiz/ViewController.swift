//
//  ViewController.swift
//  iQuiz
//
//  Created by Vivian Nguyen on 5/5/21.
//

import UIKit


let topics: [Quizzes] = [
     Quizzes(subj: "Mathematics", desc:"Test your number skills!" , image: "Equations",
             question:[ Questions(q: "What is 2 - 2", ans: ["1", "2", "4","0"], correctAns: 3),
                        Questions(q: "What is 4 + 1", ans: ["5", "3", "41", "4"], correctAns: 0)]),
     Quizzes(subj: "Marvel Super Heroes", desc: "Are you a true marvel fan?" , image: "mcu",
             question: [ Questions(q: "Who is Spiderman?", ans: ["A man spider", "Peter Parker", "Batman", "I hate spiders"], correctAns: 1)]),
     Quizzes(subj: "Science", desc: "Can you Bill Nye the science guy?", image: "science",
             question: [ Questions(q: "What is water?", ans: ["Air", "Parcipitation", "Liquid", "H20"], correctAns: 4)])
 ]

class Quizzes: NSObject {
    var subjects: String
    var descrip: String
    var imgs: String
    var questions: [Questions] = []
    
    init(subj: String, desc: String, image: String, question: [Questions]) {
        self.subjects = subj
        self.descrip = desc
        self.imgs = image
        
    }
}

class Questions: NSObject {
    var question: String
    var correctAnswer = 0
    var options: [String] = []
    
    init(q: String, ans: [String], correctAns:Int) {
        self.question = q
        self.options = ans
        self.correctAnswer = correctAns
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /*var subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
    var imgs = ["Equations", "mcu", "science"]
    var descrip = ["Test your number skills!", "Are you a true marvel fan?", "Can you Bill Nye the science guy?"]*/
    
    @IBOutlet weak var tableView : UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        let categories = topics[indexPath.row]
        cell.textLabel?.text = categories.subjects
        cell.detailTextLabel?.text = categories.descrip
        cell.imageView?.image = UIImage(named: categories.imgs)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionView = self.storyboard?.instantiateViewController(withIdentifier: "QuestionView") as! QuestionView
        //questionView.quizzes = topics[indexPath.row]
        self.present(questionView, animated: true, completion: nil)
        
    }

    @IBAction func settingsAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in NSLog("The \"OK\" alert occured")}))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }

}

class QuestionView: UIViewController {
    var quizzes: Quizzes?
    var questionNum = 0
    var answer = 0
    var numRight = 0
    
    
    @IBOutlet weak var questionTest: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var submitButton: UIButton!

    
    @IBAction func firstChoice(_ sender: UIButton) {
        optionB.backgroundColor = UIColor.systemBlue
        optionC.backgroundColor = UIColor.systemBlue
        optionD.backgroundColor = UIColor.systemBlue
        sender.backgroundColor = UIColor.black
        answer = 0
        submitButton.isEnabled = true
    }
    
    @IBAction func secondChoice(_ sender: UIButton) {
        optionA.backgroundColor = UIColor.systemBlue
        optionC.backgroundColor = UIColor.systemBlue
        optionD.backgroundColor = UIColor.systemBlue
        sender.backgroundColor = UIColor.black
        answer = 1
        submitButton.isEnabled = true
        
    }
    
    @IBAction func thirdChoice(_ sender: UIButton) {
        optionA.backgroundColor = UIColor.systemBlue
        optionB.backgroundColor = UIColor.systemBlue
        optionD.backgroundColor = UIColor.systemBlue
        sender.backgroundColor = UIColor.black
        answer = 2
        submitButton.isEnabled = true

    }
    
    @IBAction func fourthChoice(_ sender: UIButton) {
        optionA.backgroundColor = UIColor.systemBlue
        optionB.backgroundColor = UIColor.systemBlue
        optionC.backgroundColor = UIColor.systemBlue
        sender.backgroundColor = UIColor.black
        answer = 3
        submitButton.isEnabled = true
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        let answerView = self.storyboard?.instantiateViewController(withIdentifier: "AnswerView") as! AnswerView
        self.present(answerView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*questionTest.text = (quizzes?.questions[questionNum].question)!
        optionA.setTitle(quizzes?.questions[questionNum].options[0], for: .normal)
        optionB.setTitle(quizzes?.questions[questionNum].options[1], for: .normal)
        optionC.setTitle(quizzes?.questions[questionNum].options[2], for: .normal)
        optionD.setTitle(quizzes?.questions[questionNum].options[3], for: .normal)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

class AnswerView: UIViewController {
    var questionNum:Int = 0
    var answer:Int = 0
    var numRight:Int = 0
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var correctAnswerText: UILabel!
    @IBOutlet weak var indicator: UILabel!
    
    
    @IBAction func nextQ(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
    
class FinishedView: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

