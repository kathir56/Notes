//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Kathiravan Murali on 01/03/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("lineCount") var linelimit : Int = 1
    @State private var notes : [Note] = [Note]()
    @State private var text : String = ""
    
    func getDocumentDirectory() -> URL
    {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save()
    {
        //dump(notes)
        
        do
        {
            // converting notes array to data using jsonEncoder
            let data = try JSONEncoder().encode(notes)
            
            //create url path to save the file using getDocumentary
            let url = getDocumentDirectory().appending(path: "notes")
            
            // writing data to given url
            try data.write(to: url)
        }
        catch
        {
            print("Saving Data has Failed")
        }
    }
    
    func load()
    {
        DispatchQueue.main.async {
            do
            {
                //get the notes url path
                let url = getDocumentDirectory().appending(path: "notes")
                
                //create new property for data path
                let data = try Data(contentsOf: url)
                
                // decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            }
             catch
             {
                 //do nothing
             }
        }
    }
    
    func delete(offset : IndexSet)
    {
        notes.remove(atOffsets: offset)
        save()
    }
    
    
    var body: some View {
        NavigationStack
        {
            
            VStack {
                HStack(alignment: .center,spacing: 6, content: {
                    TextField("Add New Note", text: $text)
                    
                    Button {
                        //checking whether textfield is empty or not
                        guard text.isEmpty == false else {return}
                        
                        //create note
                        let note = Note(id: UUID(), text: text)
                        
                        //append to notes
                        notes.append(note)
                        
                        //making textfield empty
                        text = ""
                        
                        //save
                        save()
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42))
                            .foregroundStyle(.accent)
                    }// Mark - button
                    .buttonStyle(PlainButtonStyle())
                    .fixedSize()

                })// Mark - hstack
                Spacer()
                
                if notes.count >= 1 {
                    List
                    {
                        ForEach(0..<notes.count,id:\.self){ i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack {
                                    Capsule()
                                        .frame(width: 6)
                                        .foregroundStyle(.accent)
                                    
                                    Text(notes[i].text)
                                        .lineLimit(linelimit)
                                        .padding(.leading,5)
                                }
                            }
                        }// Mark - loop
                        .onDelete(perform: { indexSet in
                            delete(offset: indexSet)
                            save()
                        })
                }
                } 
                else
                {
                    Image(systemName: "note.text.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.gray)
                        .opacity(0.2)
                        .padding(25)
                        //.padding(45)
                }
                
            }// Mark - vstack
            .onAppear(perform: {
                load()
            })
            .navigationTitle("Notes")
            
        }// Mark - navigationstack
    }
}

#Preview {
    ContentView()
}
