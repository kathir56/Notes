//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Kathiravan Murali on 01/03/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        
        VStack(spacing:3)
        {
            Image("developer-no1")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
    
            
            HeaderView(text: "credits")
            
            Text("KATHIRAVAN")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("Developer")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    CreditsView()
}
