//
//  VinylListViewController.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 08/03/2023.
//

import UIKit
import SwiftUI

class VinylListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let library = Library()
    let format = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        library.populateDemoData()

        tableView.dataSource = self
        tableView.delegate = self

        let notCenter = NotificationCenter.default

        notCenter.addObserver(forName: Notification.Name(rawValue: "LibraryChanged"), object: library, queue: OperationQueue.main) { notif in
            self.tableView.reloadData()
        }
    }

    @IBAction func refresh(_ sender: Any) {
        tableView.reloadData()
    }

    @IBAction func showSearch(_ sender: Any) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "mint") {
//            show(vc, sender: nil)
//        }

        let list = VinylListView()
        let host = UIHostingController(rootView: list)

        show(host, sender: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        if segue.identifier == "showForm", let destination = segue.destination as? ViewController {
            destination.library = library
        } else if segue.identifier == "showDetails" {
            guard let cell = sender as? UITableViewCell,
                    let ip = tableView.indexPath(for: cell) else { return }
            segue.destination.title = library.vinyls[ip.row].albumName
        }
    }
}

extension VinylListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return library.vinyls.count
        default:
            return 10
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        default:
            fatalError("Section not config")
        }

        if let cell = cell as? DemoCustomTableViewCell {
            cell.titleLabel.text = "Youhou"
            cell.switch.isOn = indexPath.row.isMultiple(of: 2)
        } else {
            // Get config
            var config = cell.defaultContentConfiguration()

            //Configure
            let vinyl = library.vinyls[indexPath.row]
            config.text = vinyl.albumName
            config.textProperties.color = UIColor.label
            config.secondaryText = vinyl.artist
            config.secondaryTextProperties.color = UIColor.secondaryLabel
            config.image = UIImage(systemName: "opticaldisc.fill")
//            config.image = UIImage(named: "go_down_indicator")

            //Assign the config
            cell.contentConfiguration = config

            for i in 0...1000 {
                format.dateStyle = .medium
                print(format.string(from: Date()))
            }
        }

        // Configure the cell
//        cell.textLabel?.text = "Toto"

        print("Returning cell at \(indexPath)")
        return cell
    }
}

extension VinylListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if indexPath.row > 5 {
            let action = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in

            }
//            action.backgroundColor =
            action.image = UIImage(systemName: "trash")
            return UISwipeActionsConfiguration(actions: [action])
        }

        return nil
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Title of section 1"
        case 1:
            return "Title of section 2"
        default:
            return nil
        }
    }
}
