//
//  HW3App.swift
//  HW3
//
//  Created by Aruzhan Zhakhan on 05.04.2023.
//

import SwiftUI

@main
struct HW3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
