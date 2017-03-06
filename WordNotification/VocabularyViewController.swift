//
//  VocabularyViewController.swift
//  WordNotification
//
//  Created by 11397236 on 2/28/17.
//  Copyright © 2017 SuriHome. All rights reserved.
//

import UIKit

class VocabularyViewController: BaseViewController {
    
    @IBOutlet weak var tf_word: UITextField!
    @IBOutlet weak var tf_mean: UITextField!
    @IBOutlet weak var tf_example: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "NEW_VOCABULARY".localize
        self.localize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func localize() {
        self.tf_word.placeholder = "VOCABULARY".localize
        self.tf_mean.placeholder = "MEANING".localize
        self.tf_example.placeholder = "EXAMPLE".localize
    }
    
    @IBAction func addNewWord() {
        guard let word = tf_word.text else {
            print("Please input the word")
            return
        }
        var mean: String = ""
        if (tf_mean.text != nil) {
            mean = tf_mean.text!
        }
        var example: String = ""
        if (tf_example.text != nil) {
            example = tf_example.text!
        }
        
        let voca: Vocabulary = Vocabulary()
        voca.word = word
        voca.mean = mean
        voca.example = example
        voca.status = 0
        voca.id = VocabularyObject.getMaxId()
        
        Vocabulary.parseInBackground(data: voca).continueWith(continuation: { task in
            if task.cancelled {
                // Save was cancelled
            } else if task.faulted {
                // Save failed
            } else {
                // Object was successfully saved
                self.showMessage(message: "MESSAGE_ADD_NEW_VOCABULARY_SUCCESS".localize)
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
