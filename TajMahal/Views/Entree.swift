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
                            
                            Entreelabel(apetizer:apetizer)
                          
                        }
                        
                    }
                }
            }
            
        }.listStyle(.plain).listRowBackground(Color.clear).listSectionSeparator(.hidden, edges: .bottom)// gerer l'apparence
    }
}

struct Entreelabel : View {
    var apetizer : Dish
    var body: some View {
        HStack {
            
            Image("\(apetizer.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10).padding(.top,12).padding(.leading,12).padding(.bottom,12)
            
            VStack(alignment: .leading) {
                
                Text(apetizer.name)
                   
                
                Text(apetizer.description).font(.caption2).fontWeight(.medium).multilineTextAlignment(.leading)
                
                HStack{
                    
                    Text("\(apetizer.price,format:.number.precision(.fractionLength(2)))€")//format number permet de manipuler l'affichage du nombre
                    
                    Spacer()
                    
                    Image("\(apetizer.spiceLevel)")
                }
            }
            Spacer()
        }.padding()
            .frame(width: 335, height: 110).cornerRadius(10).background(.white)
    }
}
