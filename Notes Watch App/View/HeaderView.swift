//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Kathiravan Murali on 01/03/24.
//

import SwiftUI

struct HeaderView: View {
    var text : String
    var body: some View {
        
        VStack {
            
            if text != ""
            {
                Text(text.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            HStack
            {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
                    
            }// Hstack
        .foregroundStyle(.accent)
        }// Vstack
        
    }
}

#Preview {
    HeaderView(text: "")
}
