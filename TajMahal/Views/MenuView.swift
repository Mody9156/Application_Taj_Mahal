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
            VStack {
                Text("Menus").fontWeight(.bold)
                List {// utilisation de l'autre manière d'incrémenter un tableau avec foreach
                    Section("Entrées") {// titre de la setion
                        ForEach(viewModel.apetizerArray ,id:\.id){ apetizer in
                            
                            NavigationLink {
                                Image("\(apetizer.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10)
                            } label: {
                                HStack {
                                    Image("\(apetizer.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10)
                                    
                                    VStack(alignment: .leading) {
                                        Text(apetizer.name)
                                            .font(.title3).foregroundColor(.gray).fontWeight(.bold)
                                        Text(apetizer.description).foregroundColor(.gray)
                                        HStack{
                                            Image("\(apetizer.spiceLevel)")
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                    Section("Plats Principaux") {// titre de la setion
                        ForEach(viewModel.mainCourseArray ,id:\.id){ mainCourse in
                            NavigationLink {
                                Image("\(mainCourse.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10)
                            } label: {
                                
                                HStack {
                                    Image("\(mainCourse.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10)
                                    
                                    VStack(alignment: .leading) {
                                        Text(mainCourse.name)
                                            .font(.title3).foregroundColor(.gray).fontWeight(.bold)
                                        Text(mainCourse.description).foregroundColor(.gray)
                                        HStack{
                                            Image("\(mainCourse.spiceLevel)")
                                        }
                                    }
                                }.frame(width: 335, height: 110).cornerRadius(10)
                            }.navigationBarTitle(mainCourse.imageName)

                        }
                    }
                }
                    
                
            }
        }
        
    }
}

struct MenuView_Preview : PreviewProvider{
    static var previews :  some View {
        MenuView()
    }
}
