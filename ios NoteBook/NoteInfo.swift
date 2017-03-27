//
//  File.swift
//  ios NoteBook
//
//  Created by 123 on 16/10/24.
//  Copyright © 2016年 123. All rights reserved.
//

import Foundation

class NoteInfo: NSObject, NSCoding{
    var title: String
    var content: String
    var date: String
    
    //构造方法
    init(title: String = "", content: String = "",date: String = ""){
        self.title = title
        self.content = content
        self.date = date
        super.init()
    }
    
    //从nsobject解析回来
    required init(coder aDecoder:NSCoder){
        self.title=aDecoder.decodeObject(forKey: "Title") as! String
        self.content=aDecoder.decodeObject(forKey: "Content") as! String
        self.date=aDecoder.decodeObject(forKey: "Date") as! String
    }
    
    //编码成object
    func encode(with aCoder:NSCoder){
        aCoder.encode(title,forKey:"Title")
        aCoder.encode(content,forKey:"Content")
        aCoder.encode(date,forKey:"Date")
    }
}
