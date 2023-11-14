//
//  AllPatientsViewController.swift
//  MyHomeTask
//
//  Created by Георгий Евсеев on 5.11.23.
//

import Foundation
import UIKit

class AllPatientsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        Manager.shared.delegateTVC1 = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Manager.shared.getOfPatients().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        if Manager.shared.patients[indexPath.row].doctor != nil {
            cell.cellButton.isHidden = true
        } else {
            cell.cellButton.isHidden = false
        }
        cell.cellLabel.text = "\(indexPath.row + 1). \(Manager.shared.patients[indexPath.row].name). Doctor: \(Manager.shared.patients[indexPath.row].doctor?.name ?? "no assign")"

        cell.setUpButton(with: { Manager.shared.assignOfDoctor(at: indexPath.row) })

        return cell
    }
}
