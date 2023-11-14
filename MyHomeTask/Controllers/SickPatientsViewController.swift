//
//  File.swift
//  MyHomeTask
//
//  Created by Георгий Евсеев on 5.11.23.
//

import Foundation
import UIKit

class SickPatientsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        Manager.shared.delegateTVC2 = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            Manager.shared.getIllPattients().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell

        cell.cellLabel.text = "\(indexPath.row + 1). \(Manager.shared.getIllPattients()[indexPath.row].name). Doctor: \(Manager.shared.getIllPattients()[indexPath.row].doctor?.name ?? "no assign")"
        cell.setUpButton(with: { Manager.shared.changeStateOfHealth(at: indexPath.row) })
        return cell
    }
}
