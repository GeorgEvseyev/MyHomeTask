//
//  AddNewPatientsViewController.swift
//  MyHomeTask
//
//  Created by Георгий Евсеев on 5.11.23.
//

import Foundation
import UIKit

class AddNewPatientsViewController: UIViewController {
    let nameTextField = UITextField()
    let ageTextField = UITextField()
    let stateOfHealthTextView = UITextField()
    let cityTextField = UITextField()
    let streetTextField = UITextField()
    let numberOfHouseTextField = UITextField()
    let addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        drowSubViews()
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        view.addSubview(streetTextField)
        view.addSubview(cityTextField)
        view.addSubview(numberOfHouseTextField)
        view.addSubview(addButton)
    }
    
    func drowSubViews() {
        nameTextField.frame = CGRect(x: view.frame.width / 2 - 100, y: 100, width: 200, height: 40)
        nameTextField.backgroundColor = .white
        nameTextField.placeholder = "Name Surname"
        nameTextField.becomeFirstResponder()
        nameTextField.textContentType = .name
        
        
        ageTextField.frame = CGRect(x: view.frame.width / 2 - 100, y: nameTextField.frame.minY + 75, width: 200, height: 40)
        ageTextField.backgroundColor = .white
        ageTextField.placeholder = "Year of Birth"
        ageTextField.textContentType = .birthdateYear
        
        
        cityTextField.frame = CGRect(x: view.frame.width / 2 - 100, y: ageTextField.frame.minY + 75, width: 200, height: 40)
        cityTextField.backgroundColor = .white
        cityTextField.placeholder = "City"
        ageTextField.textContentType = .addressCity
        
        
        streetTextField.frame = CGRect(x: view.frame.width / 2 - 100, y: cityTextField.frame.minY + 75, width: 200, height: 40)
        streetTextField.backgroundColor = .white
        streetTextField.placeholder = "Street"
        streetTextField.textContentType = .streetAddressLine1
        
        numberOfHouseTextField.frame = CGRect(x: view.frame.width / 2 - 100, y: streetTextField.frame.minY + 75, width: 200, height: 40)
        numberOfHouseTextField.backgroundColor = .white
        numberOfHouseTextField.placeholder = "Number Of House"
        numberOfHouseTextField.textContentType = .oneTimeCode
        
        
        addButton.frame = CGRect(x: view.frame.width / 2 - 25, y: numberOfHouseTextField.frame.minY + 75, width: 50, height: 40)
        addButton.backgroundColor = .red
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addPatient), for: .touchUpInside)
        
    }
    
    @objc func addPatient() {
        if let name = nameTextField.text?.capitalized {
            if let age = ageTextField.text {
                if let city = cityTextField.text {
                    if let street = streetTextField.text {
                        if let numberOfHouse = numberOfHouseTextField.text {
                            let newPatientAdress = Address(city: city, street: street, numberOfHouse: numberOfHouse)
                            Manager.shared.patients.append(Patient(patientID: Manager.shared.patients.count + 1, name: name, age: age, stateOfHealth: false, adress: newPatientAdress, doctor: nil))
                            addButton.isEnabled = true
                            navigationController?.popViewController(animated: true)
                        }
                        
                    }
                }
            }
        }
    }
}
