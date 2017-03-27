//
//  DetailController.swift
//  ios NoteBook
//
//  Created by 123 on 16/10/24.
//  Copyright © 2016年 123. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    var notenumber:Int!
    var notetitle:String!
    var notecontent:String!
    var notedate:String!
    @IBOutlet weak var 标题: UINavigationItem!
    @IBOutlet weak var 内容: UITextView!
    @IBOutlet weak var 日期: UILabel!
    let noteModel = NoteModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        noteModel.loadData()
        标题.title = noteModel.NoteList[notenumber].title
        内容.text = noteModel.NoteList[notenumber].content
        日期.text = noteModel.NoteList[notenumber].date
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func EidtViewController(segue:UIStoryboardSegue) {
        noteModel.loadData()
        let addview = segue.source as! EditController
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date = dformatter.string(from: NSDate() as Date)
        noteModel.NoteList[notenumber] = NoteInfo(title: addview.titletext.text!, content: addview.contenttext.text, date: date)
        noteModel.saveData()
        viewDidLoad()
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteEdit" {
            let noteview = segue.destination as! EditController
            noteview.nowtitle = 标题.title
            noteview.nowcontenet = 内容.text
        }
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
