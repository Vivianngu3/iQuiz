//
//  ViewController.swift
//  iQuiz
//
//  Created by Vivian Nguyen on 5/5/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var subjects = ["Mathematics", "Marvel Super Heroes", "Science"]
    var imgs = ["Equations", "mcu", "science"]
    var descrip = ["Test your number skills!", "Are you a true marvel fan?", "Can you Bill Nye the science guy?"]
    
    @IBOutlet weak var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "customCell")
    }

    @IBAction func settingsAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in NSLog("The \"OK\" alert occured")}))
        self.present(alert, animated: true, completion: nil)
        
    }

}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell
        cell?.commonInit(subjects[indexPath.row], imgs[indexPath.row], descrip[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(subjects[indexPath.row])
    }
    
}

    
  

