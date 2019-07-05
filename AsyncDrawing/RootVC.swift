//
//  RootVC.swift
//  AsyncDrawing
//
//  Created by Ahmed Khalaf on 7/5/19.
//  Copyright © 2019 Arabia-IT. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! PagerHostVC).vcId = segue.identifier!
    }
}
