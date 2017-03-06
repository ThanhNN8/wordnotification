//
//  MainViewController.swift
//  WordNotification
//
//  Created by 11397236 on 3/1/17.
//  Copyright © 2017 SuriHome. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: BaseViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableVocabulary: UITableView!
    
    var arrayVocabulary: [Vocabulary] = []
    var currentVocabulary: [Vocabulary] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "HOME"
        self.createRightBarButton()
        self.arrayVocabulary = try! Realm().objects(Vocabulary.self).toArray(ofType: Vocabulary.self)
        self.tableVocabulary.register(UINib(nibName: "ItemVocabularyCell", bundle: nil), forCellReuseIdentifier: "ElementCell")
        tableVocabulary.separatorStyle = .none
        tableVocabulary.rowHeight = UITableViewAutomaticDimension
        tableVocabulary.estimatedRowHeight = 60
        self.segment.setTitle("IN_PROGRESS".localize, forSegmentAt: 0)
        self.segment.setTitle("DONE".localize, forSegmentAt: 1)
        self.segment.setTitle("NEW".localize, forSegmentAt: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateTable()
    }
    
    func createRightBarButton() {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        rightButton.setTitle("ADD".localize, for: .normal)
        rightButton.addTarget(self, action: #selector(addNewVocabulary), for: .touchUpInside)
        let rightBarItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    func addNewVocabulary() {
        let vocabularyView = VocabularyViewController(nibName: "VocabularyViewController", bundle: nil)
        self.navigationController?.pushViewController(vocabularyView, animated: true)
    }
    
    @IBAction func segmentSelect() {
        self.updateTable()
    }
    
    func updateTable() {
        self.currentVocabulary.removeAll(keepingCapacity: false)
        for voca: Vocabulary in self.arrayVocabulary {
            if segment.selectedSegmentIndex == 0 && voca.status == 1 {
                self.currentVocabulary.append(voca)
            } else if segment.selectedSegmentIndex == 1 && voca.status == 2 {
                self.currentVocabulary.append(voca)
            } else if segment.selectedSegmentIndex == 2 && voca.status == 0 {
                self.currentVocabulary.append(voca)
            }
        }
        self.tableVocabulary.reloadData()
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentVocabulary.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Getting the right element
        let element = self.currentVocabulary[indexPath.row]
        
        // Instantiate a cell
        let cellIdentifier = "ElementCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemVocabularyCell
        
        cell.selectionStyle = .none
        
        // Adding the right informations
        cell.setDataForCell(word: element)
        
        // Returning the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let element = self.currentVocabulary[indexPath.row]
        var title: String = "IN_PROGRESS".localize
        if segment.selectedSegmentIndex == 0 {
            title = "DONE".localize
        }
        let editAction = UITableViewRowAction(style: .destructive, title: title, handler: {_,_ in
            var status: Int = 2
            if self.segment.selectedSegmentIndex != 0 {
                status = 1
            }
            let realm = try! Realm()
            
            // Insert from NSData containing JSON
            try! realm.write {
                element.status = status
            }
            self.updateTable()
        })
        return [editAction]
    }
}
