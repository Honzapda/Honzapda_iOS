//
//  HonzapdaApp.swift
//  Honzapda
//
//  Created by YOUJIM on 2/24/24.
//

import SwiftUI

@main
struct HonzapdaApp: App {
    var body: some Scene {
        WindowGroup {
            CurationMainView(curationViewModel: CurationViewModel())
        }
    }
}
