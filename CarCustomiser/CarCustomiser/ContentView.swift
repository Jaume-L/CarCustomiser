//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Louis Jaume on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var ecuAndFuelSystemPackage = false
    @State private var drivetrainPackage = false
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        
        let ecuAndFuelSystemPackageBinding = Binding<Bool> (
            get: { self.ecuAndFuelSystemPackage },
            set: { newValue in
                self.ecuAndFuelSystemPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 3.0
                } else {
                    starterCars.cars[selectedCar].acceleration += 3.0
                }
            }
        )
        
        let drivetrainPackageBinding = Binding<Bool> (
            get: { self.drivetrainPackage },
            set: { newValue in
                self.drivetrainPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 3
                    starterCars.cars[selectedCar].acceleration -= 1.8
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 3
                    starterCars.cars[selectedCar].acceleration += 1.8
                }
            }
        )
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(starterCars.cars[selectedCar].displayStats())")
                Button("Next Car", action: {
                    selectedCar += 1
                    exhaustPackage = false
                    tiresPackage = false
                    ecuAndFuelSystemPackage = false
                    drivetrainPackage = false
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Tires Package", isOn: tiresPackageBinding)
                Toggle("ECU and Fuel Package", isOn: ecuAndFuelSystemPackageBinding)
                Toggle("Drivetrain Package", isOn: drivetrainPackageBinding)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
