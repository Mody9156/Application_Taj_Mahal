//
//  Plats.swift
//  TajMahal
//
//  Created by KEITA on 29/01/2024.
//

import SwiftUI

struct Plats: View {
    let viewModel: ViewModel = ViewModel()
    var body: some View {
        Section(header:Text("Plats Principaux")) {// titre de la setion
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.mainCourseArray ,id:\.id){ mainCourse in
                        NavigationLink {
                        
                            ScrollView {
                                VStack {
                                    Spacer()
                                        Image("\(mainCourse.imageName)").resizable().aspectRatio(contentMode: .fill).frame(width: 335,height: 467).cornerRadius(10)
                                        
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            Text("Allergènes:").foregroundColor(.gray).fontWeight(.bold).padding()
                                            Text(mainCourse.allergens).foregroundColor(.gray)
                                        
                                            Spacer()
                                            Text("Ingredients:").foregroundColor(.gray).fontWeight(.bold).padding()
                                               
                                            Text(mainCourse.ingredients).foregroundColor(.gray)
                                            Spacer()
                                        }.padding()
                                  
                                }
                            }.navigationBarTitle(mainCourse.name)
                        } label: {
                            
                            PlatsLabels(mainCourse:mainCourse)
                        }
                    }
                }
            }
            
        }.listStyle(.plain).listRowBackground(Color.clear).listSectionSeparator(.hidden, edges: .bottom)// gerer l'apparence
        
           
        }
    }



struct PlatsLabels : View {
    var mainCourse : Dish
    var body: some View {
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
            }.background(.white).frame(width: 335,height: 110)
                
        }
    }
}
