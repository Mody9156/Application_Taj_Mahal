//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste
struct MenuView: View {
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let viewModel: ViewModel = ViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .center) {
                
                List {
                    
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
//                    Entree()//incrémentation des entrées sous fourme de liste
                    
                    Plats()//incrémentation des plats sous fourme de liste
                    
                }
            }.navigationBarTitle("Menus")

        }
    }
        

}

struct MenuView_Preview : PreviewProvider{
    
    static var previews :  some View {
       
            MenuView()
    
    }
}
//#Preview{
//    MenuView()
//}
