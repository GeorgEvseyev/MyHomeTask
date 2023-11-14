//
//  Doctors.swift
//  MyHomeTask
//
//  Created by Георгий Евсеев on 5.11.23.
//

import Foundation

final class Doctor {
    var name: String
    var lookForPatient: Patient?

    init(name: String, lookForPatient: Patient?) {
        self.name = name
        self.lookForPatient = lookForPatient
    }
}
