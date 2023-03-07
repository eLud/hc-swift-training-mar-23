//
//  ViewController.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 07/03/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print("View did load")
    }

    @IBAction func migrateName(_ sender: UIButton) {
        print("Le nom est \(nameTextfield.text)")
    }
}

