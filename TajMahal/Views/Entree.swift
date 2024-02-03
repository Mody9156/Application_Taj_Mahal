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
            
        }.listStyle(.plain).listRowBackground(Color.clear).listSectionSeparator(.hidden, edges: .bottom)//gerer l'affichage de la list
    }
}

struct Entreelabel : View { // éléments de la liste des entrées affichées
    
    var apetizer : Dish //
    
    var body: some View {
        
        HStack {
            
            Image("\(apetizer.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10).padding(10)
            
            VStack(alignment: .leading) {
                
                Text(apetizer.name).lineSpacing(10).font(.system(size: 14, weight: .bold, design: .serif)).foregroundColor(.gray).padding(.bottom,5)
            
                
                Text(apetizer.description).font(.caption2).fontWeight(.medium).foregroundColor(.gray).multilineTextAlignment(.leading)
                
                HStack{
                    
                    Text("\(apetizer.price,format:.number.precision(.fractionLength(2)))€").foregroundColor(.gray).font(.system(size: 12, weight: .bold, design: .serif))//format number permet de manipuler l'affichage
                    
                    Spacer()
                    
                    Image("\(apetizer.spiceLevel)").foregroundColor(.gray)
                }
            }
            
            Spacer()
            
        }.frame(width: 335,height: 110).background(.white).cornerRadius(10)
    }
}


extension  Entree {
        func Entrelink(apetizer : Dish) -> some View { // func à la place de "var EntreLink : some View", pour éviter les erreurs
            VStack {
                NavigationLink {
            
                    ZStack (alignment: .topTrailing){
                        
                        Image("\(apetizer.imageName)").resizable().aspectRatio(contentMode: .fill).frame(width: 335,height: 467).cornerRadius(11)
                        
                        ZStack (alignment: .center){
                            
                            Rectangle().fill(Color.white).frame(width: 74, height: 22).cornerRadius(10)
                            
                            Image("\(apetizer.spiceLevel)").frame(width: 64, height: 12)
                        }.padding(10)
                    }
                    
                    VStack (alignment: .leading) {
                      

                        VStack(alignment: .leading)  {
                            Text("Allergènes:").foregroundColor(.gray).fontWeight(.bold).multilineTextAlignment(.leading).padding(5)
                            Text(apetizer.allergens).foregroundColor(.gray).multilineTextAlignment(.leading)
                        }
                       
                        Divider().frame(width: 335,height: 2)
                     
                        VStack (alignment: .leading) {
                            Text("Ingredients:").foregroundColor(.gray).fontWeight(.bold).multilineTextAlignment(.leading).padding(5)
                            
                            Text(apetizer.ingredients).font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.leading)
                        }
                       

                        
                    }.padding(.leading,40)
                        .navigationBarTitle(Text(apetizer.name).foregroundColor(.black))
                                    
                } label: {
            
            Entreelabel(apetizer:apetizer) // strcut  Entreelabel ⇡
            
                }
        
            }
    }
}

