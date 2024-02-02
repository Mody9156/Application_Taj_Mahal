//
//  Entree.swift
//  TajMahal
//
//  Created by KEITA on 29/01/2024.
//

import SwiftUI

struct Entree: View {
    
    let viewModel: ViewModel = ViewModel()
    
    var body: some View {
        
        Section("Entrées") {// titre de la setion
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(viewModel.apetizerArray ,id:\.id){ apetizer in
                        
                        Entrelink(apetizer:apetizer)// Les éléments supplémentaires de l'entrée selectionnée ⇣
                      
                    }
                }
            }
            
        }.listStyle(.plain).listRowBackground(Color.clear).listSectionSeparator(.hidden, edges: .bottom).cornerRadius(10) //gerer l'affichage de la list
    }
}

struct Entreelabel : View { // éléments de la liste des entrées affichées
    
    var apetizer : Dish //
    
    var body: some View {
        
        HStack {
            
            Image("\(apetizer.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10)
            
            VStack(alignment: .leading) {
                
                Text(apetizer.name).font(.system(size: 14, weight: .bold, design: .serif)).foregroundColor(.gray).padding()
                   
                
                Text(apetizer.description).font(.caption2).fontWeight(.medium).multilineTextAlignment(.leading).foregroundColor(.gray).padding()
                
                HStack{
                    
                    Text("\(apetizer.price,format:.number.precision(.fractionLength(2)))€").foregroundColor(.gray)//format number permet de manipuler l'affichage
                    
                    Spacer()
                    
                    Image("\(apetizer.spiceLevel)").foregroundColor(.gray)
                }.padding()
            }
            Spacer()
            
        }.padding().background(.white)
    }
}


extension  Entree {
        func Entrelink(apetizer : Dish) -> some View { // func à la place de "var EntreLink : some View", pour éviter les erreurs
    NavigationLink {
        
        ScrollView {
            
            VStack {
                
                Spacer()
                
                ZStack(alignment: .topTrailing) {
                    
                    Image("\(apetizer.imageName)").resizable().aspectRatio(contentMode: .fill).frame(width: 335,height: 467).cornerRadius(11)
                    
                    ZStack(alignment: .topTrailing) {
                        
                        Rectangle().fill(Color.white).cornerRadius(10).frame(width: 74, height: 22).padding()
                        
                        Image("\(apetizer.spiceLevel)").frame(width: 58, height: 14).padding()
                    }
                    
                    
                }
                
                VStack(alignment: .leading) {
                    
                    Spacer()
                    
                    Text("Allergènes:").foregroundColor(.gray).fontWeight(.bold).padding()
                    
                    Text(apetizer.allergens).foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Ingredients:").foregroundColor(.gray).fontWeight(.bold).padding()
                    
                    Text(apetizer.ingredients).foregroundColor(.gray)
                    
                    Spacer()
                    
                }.padding()
                
            }.navigationTitle(apetizer.imageName)
        }
    } label: {
        
        Entreelabel(apetizer:apetizer) // strcut  Entreelabel ⇡
    }
    }
}

