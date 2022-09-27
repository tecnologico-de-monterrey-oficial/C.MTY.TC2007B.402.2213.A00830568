//
//  ContentView.swift
//  App08-PAM
//
//  Created by Edgar Alexandro on 26/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pamModel = PAMModel()
    
    var dateFormat: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat="yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View{
        NavigationView{
            ZStack{
                List{
                    ForEach(pamModel.pams) { pam in
                        VStack {
                            Text(pam.name)
                            Text(dateFormat.string(from:pam.birth_date))
                        }
                    }
                    .onDelete(perform: deletePAM)
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        EditButton()
                    }
                }
                Button {
                    addPAM()
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
        }
    }
    
    func deletePAM(offsets: IndexSet){
        for index in offsets{
            pamModel.deletePAM(pam: pamModel.pams[index])
            pamModel.pams.remove(at: index)
        }
    }
    
    func addPAM(){
        var pam = PAM(id: 0, name: "Brenda", birth_date: Date(), gender: "Mujer")
        pamModel.addPAM(pam: pam)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
