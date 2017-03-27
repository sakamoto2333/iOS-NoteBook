//
//  EditController.swift
//  ios NoteBook
//
//  Created by 123 on 16/10/24.
//  Copyright © 2016年 123. All rights reserved.
//

import UIKit

class EditController: UIViewController {

    var nowtitle: String!
    var nowcontenet: String!
    @IBOutlet weak var titletext: UITextField!
    @IBOutlet weak var contenttext: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        contenttext.layer.borderColor = UIColor.init(colorLiteralRed: 215/255, green: 215/255, blue: 215/255, alpha: 1).cgColor
        contenttext.layer.borderWidth = 1.0
        contenttext.layer.cornerRadius = 5.0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        titletext.text = nowtitle
        contenttext.text = nowcontenet
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func end(_ sender: AnyObject) {
        contenttext.becomeFirstResponder()
    }
    
    //点击空白收起键盘
    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            titletext.resignFirstResponder()
            contenttext.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
