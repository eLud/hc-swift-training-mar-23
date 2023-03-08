//
//  VinylListViewController.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 08/03/2023.
//

import UIKit

class VinylListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let library = Library()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VinylListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)

        // Configure the cell
//        cell.textLabel?.text = "Toto"

        // Get config
        var config = cell.defaultContentConfiguration()

        //Configure
        config.text = "\(indexPath)"
        config.secondaryText = "Hello"

        //Assign the config
        cell.contentConfiguration = config

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
