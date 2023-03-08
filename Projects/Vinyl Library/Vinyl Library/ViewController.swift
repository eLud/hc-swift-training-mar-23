//
//  ViewController.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 07/03/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!

    @IBOutlet weak var albumNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var releaseDatePicker: UIDatePicker!
    @IBOutlet weak var scratchedSwitch: UISwitch!
    @IBOutlet weak var speedSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print("View did load")
        menuButton.menu = UIMenu(children: [
            UIAction(title: "First Entry", handler: {_ in }),
            UIAction(title: "Second Entry", handler: {_ in }),
            UIMenu(children: [
                UIAction(title: "Second Level First Entry", handler: {_ in }),
                UIAction(title: "Second Level Second Entry", handler: {_ in }),

            ])
        ])
        configureSegmentedControl()
    }

    @IBAction func createVinyl(_ sender: UIButton) {

        guard let albumName = albumNameTextField.text, albumName.count > 3 else {
            print("Exit at album name")
            return
        }

        let date = releaseDatePicker.date
        let scratched = scratchedSwitch.isOn

        let selectedSegmentIndex = speedSegmentedControl.selectedSegmentIndex
        let speed = Vinyl.Speed.allCases[selectedSegmentIndex]

        let newVinyl = Vinyl(albumName: albumName, artist: "", releaseDate: date, numberInSerie: nil, titles: [], scratched: scratched, speed: speed)

        print("Create vinyl \(newVinyl)")


    }
}

extension ViewController {

    private func configureSegmentedControl() {
        speedSegmentedControl.removeAllSegments()
        for speed in Vinyl.Speed.allCases {
            speedSegmentedControl.insertSegment(withTitle: speed.title, at: speedSegmentedControl.numberOfSegments, animated: false)
        }
        speedSegmentedControl.selectedSegmentIndex = 0
    }
    
}
