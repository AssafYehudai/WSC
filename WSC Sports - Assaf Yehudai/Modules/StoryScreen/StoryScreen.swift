//
//  StoryScreen.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import UIKit

class StoryScreen: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.setTitle("", for: .normal)
        // Do any additional setup after loading the view.
    }


    
    @IBAction func didTapDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
}
