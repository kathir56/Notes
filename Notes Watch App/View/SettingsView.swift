//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Kathiravan Murali on 01/03/24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCount") var lineCount : Int = 1
    @State private var value : Float = 1.0
    
    func update()
    {
        lineCount = Int(value)
    }
    
    var body: some View {
        
        VStack(spacing: 8, content: {
            
            
            HeaderView(text: "settings")
            
            Text("lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                self.value
            }, set: { Value in
                self.value = Value
                self.update()
            }), in: 1...4,step: 1)
                .accentColor(.accent)
            
        })
        
    }
}

#Preview {
    SettingsView()
}
