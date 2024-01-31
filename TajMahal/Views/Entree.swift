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
            
            ForEach(viewModel.apetizerArray ,id:\.id){ apetizer in
                
                NavigationLink {
                    
                    ScrollView {
                        
                        VStack {
                            
                            Spacer()
                            
                            Image("\(apetizer.imageName)").resizable().frame(width: 335,height: 467).cornerRadius(10)
                            
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
                    
                    HStack {
                        
                        Image("\(apetizer.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            
                            Text(apetizer.name)
                                .font(.title3).foregroundColor(.gray).fontWeight(.bold)
                            
                            Text(apetizer.description).foregroundColor(.gray)
                            
                            HStack{
                                
                                Text("\(apetizer.price,format:.number.precision(.fractionLength(2)))€")//format number permet de manipuler l'affichage du nombre
                                
                                Spacer()
                                
                                Image("\(apetizer.spiceLevel)")
                            }
                        }
                        Spacer()
                    }
                }
                
            }.navigationTitle("")
            
        }
    }
}
