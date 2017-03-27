//
//  MainController.swift
//  ios NoteBook
//
//  Created by 123 on 16/10/24.
//  Copyright © 2016年 123. All rights reserved.
//

import UIKit

class MainController: UITableViewController, UIGestureRecognizerDelegate {

    
    let noteModel = NoteModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        axb()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func axb() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(LongPress))
        longPress.delegate = self
        longPress.minimumPressDuration = 0.5
        self.tableView.addGestureRecognizer(longPress)
        noteModel.loadData()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        axb()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LongPress(gestureRecongnizer:UILongPressGestureRecognizer) {
        if gestureRecongnizer.state == UIGestureRecognizerState.began {
            
        }
        if gestureRecongnizer.state == UIGestureRecognizerState.ended {
            if self.tableView.isEditing == false {
                self.tableView.setEditing(true, animated: true)
            }
            else{
                self.tableView.setEditing(false, animated: true)
            }
        }
    }
    
    @IBAction func cancelViewController(segue:UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveViewController(segue:UIStoryboardSegue) {
        let addview = segue.source as! ViewController
        let date = NSDate()
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        noteModel.NoteList.append(NoteInfo(title: addview.titletext.text!, content: addview.contenttext.text, date: dformatter.string(from: date as Date)))
        noteModel.saveData()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteModel.NoteList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NoteCell
        let notes = noteModel.NoteList[indexPath.row] as NoteInfo
        cell.Title.text = notes.title
        cell.Date.text = notes.date
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }*/
    

    //删除事件
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            noteModel.NoteList.remove(at: indexPath.row)
            noteModel.saveData()
            self.tableView.reloadData()
            self.tableView.setEditing(true, animated: true)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
 
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    */
 

    //排序
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        noteModel.loadData()
        let content = noteModel.NoteList[sourceIndexPath.row]
        noteModel.NoteList.remove(at: sourceIndexPath.row)
        noteModel.NoteList.insert(content, at: destinationIndexPath.row)
        noteModel.saveData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Notesdetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let noteview = segue.destination as! DetailController
                noteview.notenumber = indexPath.row
            }
            
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
