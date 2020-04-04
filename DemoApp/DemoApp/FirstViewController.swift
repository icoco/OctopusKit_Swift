//
//  FirstViewController.swift
//  DemoApp
//
//  Created by icoco on 04/04/2020.
//  Copyright © 2020 icoco. All rights reserved.
//

import UIKit
import SDK

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData(){
        //@step setup
        ServiceConfigurator.setupWorkSpace()
        //@step
        let service:AppService = AppService.list()
        service.execute({ (response ) in
            if let data = response as? Data{
                Logger.debugJsonData("\(self)->response:", data)
            }
            
        },  failure: { (error)in
            debugPrint( "\(self)-> failure: \(error)");
             
        }
        )
    }

}

