//
//  ViewController.swift
//  MyHomeTask
//
//  Created by Георгий Евсеев on 30.10.23.
//

import UIKit

class ViewController: UIViewController {
//    var array = [2.5, 9.7, 6.9, 8.2]
//    var result = Int()
//    var result2 = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        sumOfPartsOfNumbers()
//
//        checkNumber(number: 5)
//
//        result = sum(x: 1, y: 3)
//        print(result)
//
//        result = sub(x: 1, y: 3)
//        print(result)
//
//        result = mult(x: 1, y: 3)
//        print(result)
//
//        result = div(x: 1, y: 1)
//        print(result)
//
//        sum(number: 1234)
//
//        result2 = exponant(number: 3)
//        print(result2)
    }

    @IBAction func showPatients(_ sender: Any) {
        guard let allPatientViewController = storyboard?.instantiateViewController(identifier: "AllPatientsViewController") as? AllPatientsViewController else { return }
        navigationController?.pushViewController(allPatientViewController, animated: true)
    }

    @IBAction func showSickPatients(_ sender: Any) {
        guard let sickPatientsViewController = storyboard?.instantiateViewController(identifier: "SickPatientsViewController") as? SickPatientsViewController else { return }
        navigationController?.pushViewController(sickPatientsViewController, animated: true)
    }

    @IBAction func addNewPatients(_ sender: Any) {
        guard let addNewPatientController = storyboard?.instantiateViewController(identifier: "AddNewPatientsViewController") as? AddNewPatientsViewController else { return }
        navigationController?.pushViewController(addNewPatientController, animated: true)
    }

    ////    1. сумма отдельно целых и отдельно дробных частей чисел 2.5, 9.7, 6.9, 8.2
//
//    func sumOfPartsOfNumbers() {
//        let sumOfInteger = array.map { Int($0) }.reduce(0) { $0 + $1 }
//        print(sumOfInteger)
//
//        let sumOfFractionalNumbers = array.reduce(0) { $0 + $1 } - Double(sumOfInteger)
//        print(sumOfFractionalNumbers)
//
//        let sumOfFractionalNumbersAsInt = array.map { ($0 - Double(Int($0))) * 10 }.reduce(0) { $0 + $1 }
//        print(sumOfFractionalNumbersAsInt)
//    }

    ////    2. проверка, является ли число четным
//    func checkNumber(number: Int) {
//        if number % 2 != 1 {
//            print("\(number) is an even number!")
//        } else {
//            print("\(number) is an odd number!")
//        }
//    }
//
    ////    3. Универсальные функции сложения, вычитания, умножения и деления (перегрузка функций)
//
//    func sum(x: Int, y: Int) -> Int {
//        x + y
//    }
//    func sum(x: Double, y: Double) -> Double {
//        x + y
//    }
//
//    func sub(x: Int, y: Int) -> Int {
//        x - y
//    }
//    func sub(x: Double, y: Double) -> Double {
//        x - y
//    }
//
//    func mult(x: Int, y: Int) -> Int {
//        x * y
//    }
//    func mult(x: Double, y: Double) -> Double {
//        x * y
//    }
//
//    func div(x: Int, y: Int) -> Int {
//        x / y
//    }
//    func div(x: Double, y: Double) -> Double {
//        x / y
//    }
//
    ////    4. Вычислить сумму цифр четырехзначного числа
//
//    func sum(number: Int) {
//        let result = String(number).map { $0 }.reduce(0) { $0 + (Int(String($1)) ?? 0) }
//        print(result)
//    }
//
    ////    5. Функция возведения в степень с дефолтным параметром
//
//    func exponant(number: Double, number2: Double = 2) -> Double {
    ////        number * number
//        pow(number, number2)
//    }
}
