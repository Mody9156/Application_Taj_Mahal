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
                Text("Menus").fontWeight(.bold).font(.title2)
                List {// utilisation de l'autre manière d'incrémenter un tableau avec foreach
                    VStack {
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
                                                Text("\(apetizer.price,format:.number.precision(.fractionLength(2)))€")//format number permet de manipuler l'affichage du nombre
                                                Spacer()
                                                Image("\(apetizer.spiceLevel)")
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    VStack{
                    Section(header:Text("Plats Principaux")) {// titre de la setion
                        ForEach(viewModel.mainCourseArray ,id:\.id){ mainCourse in
                            NavigationLink {
                                Image("\(mainCourse.imageName)").resizable().frame(width: 128.84,height: 86).cornerRadius(10)
                            } label: {
                                
                                VStack {
                                    HStack {
                                        Image("\(mainCourse.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            Text(mainCourse.name)
                                                .font(.title3).foregroundColor(.gray).fontWeight(.bold)
                                            Text(mainCourse.description).foregroundColor(.gray)
                                            HStack{
                                                Text("\(mainCourse.price,format:.number.precision(.fractionLength(2)))€")//format number permet de manipuler l'affichage du nombre
                                                Spacer()
                                                Image("\(mainCourse.spiceLevel)").resizable().frame(width: 52, height: 12)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
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
//#Preview{
//    MenuView()
//}
