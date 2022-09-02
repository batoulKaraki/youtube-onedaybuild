//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by batoul karaki on 31/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
        
        
    }


}

