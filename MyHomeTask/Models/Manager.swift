//
//  Manager.swift
//  MyHomeTask
//
//  Created by Георгий Евсеев on 4.11.23.
//

import Foundation
final class Manager {
    static let shared = Manager()

    weak var delegateTVC1: AllPatientsViewController?
    weak var delegateTVC2: SickPatientsViewController?

    var index: Int = 0

    var doctors: [Doctor] = [
        Doctor(name: "Anna Alexandrova", lookForPatient: nil),
        Doctor(name: "Peter Nevskiy", lookForPatient: nil),
    ] {
        didSet {
            DispatchQueue.main.async {
                self.delegateTVC1?.tableView.reloadData()
                self.delegateTVC2?.tableView.reloadData()
            }
        }
    }

    var patients: [Patient] = [
        Patient(patientID: 1, name: "Ivan Ivanov", age: "30", stateOfHealth: false, adress: Address(city: "Minsk", street: "Pr. Nezalezhnosty", numberOfHouse: "4"), doctor: nil),
        Patient(patientID: 2, name: "Vasiliy Ivanov", age: "30", stateOfHealth: true, adress: Address(city: "Minsk", street: "Pr. Nezalezhnosty", numberOfHouse: "5"), doctor: nil),
        Patient(patientID: 3, name: "Pavel Ivanov", age: "30", stateOfHealth: true, adress: Address(city: "Minsk", street: "Pr. Nezalezhnosty", numberOfHouse: "12"), doctor: nil),
        Patient(patientID: 4, name: "Vasiliy Petrov", age: "30", stateOfHealth: false, adress: Address(city: "Minsk", street: "Pr. Nezalezhnosty", numberOfHouse: "5"), doctor: nil),
        Patient(patientID: 5, name: "Pavel Vladov", age: "30", stateOfHealth: false, adress: Address(city: "Minsk", street: "Pr. Nezalezhnosty", numberOfHouse: "12"), doctor: nil),
    ] {
        didSet {
            DispatchQueue.main.async {
                self.delegateTVC1?.tableView.reloadData()
                self.delegateTVC2?.tableView.reloadData()
            }
        }
    }

    func getDoctors() -> [Doctor] {
        return doctors
    }

    func getOfPatients() -> [Patient] {
        return patients
    }

    func getIllPattients() -> [Patient] {
        let patients = patients.filter { $0.stateOfHealth == false }
        return patients
    }

    func getFreeDoctors() -> [Doctor] {
        let doctors = doctors.filter { $0.lookForPatient == nil }
        return doctors
    }

    func assignOfDoctor(at index: Int) {
        let myPatients = getOfPatients()
        let myDoctor = getFreeDoctors().first
        myPatients[index].doctor = myDoctor
        myPatients[index].stateOfHealth = false

        myDoctor?.lookForPatient = myPatients[index]
        if let indexPatient = patients.firstIndex(where: { person in person.patientID == myPatients[index].patientID }) {
            patients[indexPatient] = myPatients[index]
        }
        if let indexDoctor = doctors.firstIndex(where: { person in person.lookForPatient?.patientID == myPatients[index].patientID }) {
            doctors[indexDoctor] = myDoctor ?? doctors[indexDoctor]
        }
    }

    func changeStateOfHealth(at index: Int, to state: Bool = true) {
        let myPatients = getIllPattients()
        let myDoctor = myPatients[index].doctor
        myPatients[index].stateOfHealth = state
        myPatients[index].doctor = nil
        myDoctor?.lookForPatient = nil

        if let indexPatient = patients.firstIndex(where: { person in person.patientID == myPatients[index].patientID }) {
            patients[indexPatient] = myPatients[index]
        }
        if let indexDoctor = doctors.firstIndex(where: { person in person.lookForPatient?.patientID == myDoctor?.lookForPatient?.patientID }) {
            doctors[indexDoctor] = myDoctor ?? doctors[indexDoctor]
        }
    }
}
