//
//  CustomTableViewCell.swift
//  iQuiz
//
//  Created by Vivian Nguyen on 5/5/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var topics: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(_ quizzes: String, _ image: String, _ bio: String) {
        topics.text = quizzes
        images.image = UIImage(named: image)
        descriptions.text = bio
    }
    
}
