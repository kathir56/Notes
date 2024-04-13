//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Kathiravan Murali on 01/03/24.
//

import SwiftUI

struct DetailView: View {
    var note : Note
    var count : Int
    var index : Int
    
    @State private var isCreditViewShown : Bool = false
    @State private var isSettingsViewShown : Bool = false
    
    var body: some View {
        
        VStack(alignment:.center,spacing: 3) {
            
            //header
            HeaderView(text: "")
            
            Spacer()
            
            //content
            ScrollView(.vertical,showsIndicators:false)
            {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    
            }// Mark - scrollview
            
            Spacer()
            
            //footer
            HStack(alignment:.center)
            {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsViewShown.toggle()
                    }
                    .sheet(isPresented: $isSettingsViewShown, content: {
                        SettingsView()
                    })
                
                Spacer()
                
                Text("\(index+1)/\(count)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditViewShown.toggle()
                    }
                    .sheet(isPresented: $isCreditViewShown, content: {
                        CreditsView()
                    })
                
            }
            .foregroundStyle(.secondary)
            
        }// Vstack
        .padding(3)
    }
}

#Preview {
    DetailView(note: notee, count: 5, index: 1)
}
