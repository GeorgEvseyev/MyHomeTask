//
//  CustomCell.swift
//  MyHomeTask
//
//  Created by Георгий Евсеев on 6.11.23.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    var closure: (() -> Void)?

    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let cellButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Discharge", for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellLabel)
        contentView.addSubview(cellButton)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10), cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50), cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])

        NSLayoutConstraint.activate([cellButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10), cellButton.leadingAnchor.constraint(equalTo: cellLabel.trailingAnchor, constant: 10), cellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10), cellButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
    }

    func setUpButton(with closure: @escaping () -> Void) {
        self.closure = closure
        cellButton.addTarget(self, action: #selector(cellButtonTapped), for: .touchUpInside)
    }

    @objc func cellButtonTapped() {
        closure?()
    }
}
