//
//  Patient.swift
//  MyHomeTask
//
//  Created by Георгий Евсеев on 4.11.23.
//

import Foundation

final class Patient {
    var patientID: Int
    var name: String
    var age: String
    var stateOfHealth: Bool
    var doctor: Doctor?
    
    var adress: Address
    
    init(patientID: Int, name: String, age: String, stateOfHealth: Bool, adress: Address, doctor: Doctor?) {
        self.patientID = patientID
        self.name = name
        self.age = age
        self.stateOfHealth = stateOfHealth
        self.adress = adress
        self.doctor = doctor
    }
}

final class Address {
    var city: String
    var street: String
    var numberOfHouse: String
    
    init(city: String, street: String, numberOfHouse: String) {
        self.city = city
        self.street = street
        self.numberOfHouse = numberOfHouse
    }
}






