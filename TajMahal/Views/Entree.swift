//
//  Entree.swift
//  TajMahal
//
//  Created by KEITA on 29/01/2024.
//

import SwiftUI

struct Entree: View {
    
    let viewModel: ViewModel = ViewModel()
    let Titlesection = Text("Entrées").font(.custom("PlusJakartaSans-700.ttf",size:14))
    
    var body: some View {
        
        Section("\(Titlesection)") {// titre de la setion
            
            ScrollView {
                LazyVStack{
                    
                    ForEach(viewModel.apetizerArray ,id:\.id){ apetizer in
                        
                        
                        
                        Entrelink(apetizer:apetizer)// Les éléments supplémentaires de l'entrée selectionnée ⇣
                    }.padding(5)
                 
                }
            }
            
        }.listStyle(.plain).listRowBackground(Color.clear).listSectionSeparator(.hidden, edges: .bottom)//gerer l'affichage de la list
    }
}

struct Entreelabel : View { // éléments de la liste des entrées affichées
    
    var apetizer : Dish //
    
    var body: some View {
        
        HStack {
            
            Image("\(apetizer.imageName)").resizable().aspectRatio(contentMode:.fill).frame(width: 112,height: 86).cornerRadius(10).padding(10)
            
            VStack(alignment: .leading) {
                
                Text(apetizer.name).lineSpacing(10).font(.system(size: 12, weight: .bold, design: .serif)).font(.custom("PlusJakartaSans-400.ttf", size: 12)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0)).padding(.bottom,5)
            
                
                Text(apetizer.description).font(.caption2).fontWeight(.medium).font(.custom("PlusJakartaSans-400.ttf", size: 15)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0)).multilineTextAlignment(.leading)
                
                HStack{
                    
                    Text("\(apetizer.price,format:.number.precision(.fractionLength(2)))€").font(.custom("PlusJakartaSans-600.ttf", size: 12)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0)).bold()//format number permet de manipuler l'affichage
                    
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
            
                NavigationLink {
            
                    ZStack (alignment: .topTrailing){
                        
                        Image("\(apetizer.imageName)").resizable().aspectRatio(contentMode:.fill).frame(width: 368,height: 560.62).cornerRadius(11)
                        
                        ZStack (alignment: .center){
                            
                            Rectangle().fill(Color.white).frame(width: 74, height: 22).cornerRadius(10)
                            
                            Image("\(apetizer.spiceLevel)").frame(width: 64, height: 12)
                            
                        }.padding(10)
                    }
                    
                    VStack (alignment: .leading) {
                      

                        VStack(alignment: .leading)  {
                            Text("Allergènes:").foregroundColor(.gray).fontWeight(.bold).multilineTextAlignment(.leading).padding(5).font(.system(size: 14))
                            
                            Text(apetizer.allergens).foregroundColor(.gray).multilineTextAlignment(.leading).font(.system(size: 12))
                        }
                       
                        Divider().frame(width: 368,height: 2)//Ligne de séparation

                        VStack (alignment: .leading) {
                            Text("Ingredients:").foregroundColor(.gray).fontWeight(.bold).multilineTextAlignment(.leading).padding(5).font(.system(size: 14))
                            
                            Text(apetizer.ingredients).font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.leading).font(.system(size: 12))
                        }
                       

                        
                    }.navigationTitle(mainCourse.name).padding(.leading,20).padding(.trailing,20)
                                    
                } label: {
            
            Entreelabel(apetizer:apetizer) // strcut  Entreelabel ⇡
            
                }
        
            }
    
}

