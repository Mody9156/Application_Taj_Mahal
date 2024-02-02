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
                    
                    ForEach(viewModel.mainCourseArray ,id:\.id){
                        
                        mainCourse in
                        
                        plats(mainCourse:mainCourse)
                       
                    }
                }
            }
            
        }.listStyle(.plain).listRowBackground(Color.clear).listSectionSeparator(.hidden, edges: .bottom)//gerer l'affichage de la list
        
           
        }
    }



struct PlatsLabels : View {

    var mainCourse : Dish
    var body: some View {
     
        
            HStack{
                    
                    Image("\(mainCourse.imageName)").resizable().frame(width: 112,height: 86).cornerRadius(10).padding(10)
                
                    
                    VStack(alignment: .leading) {
                        Text(mainCourse.name).lineSpacing(10).font(.system(size: 14, weight: .bold, design: .serif)).foregroundColor(.gray).padding(.bottom,5)
                            
                        Text(mainCourse.description).font(.caption2).fontWeight(.medium).foregroundColor(.gray).multilineTextAlignment(.leading)
                            
                        HStack{
                            Text("\(mainCourse.price,format:.number.precision(.fractionLength(2)))€").foregroundColor(.gray).font(.system(size: 12, weight: .bold, design: .serif))//format number permet de manipuler l'affichage
                            Spacer()
                            
                            Image("\(mainCourse.spiceLevel)").foregroundColor(.gray)
                            
                        }
                    }
          
            Spacer()
            
        }.frame(width: 335,height: 110).background(.white).cornerRadius(10)
                
        }
  
}

extension Plats {
    
    func plats(mainCourse : Dish) ->some View {
        NavigationLink {
        
            ScrollView {
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        Image("\(mainCourse.imageName)").resizable().aspectRatio(contentMode: .fill).frame(width: 335,height: 467).cornerRadius(10)
                        ZStack(alignment: .topTrailing) {
                            Rectangle().fill(Color.white).cornerRadius(10).frame(width: 74, height: 22).padding()
                            Image("\(mainCourse.spiceLevel)").padding()
                        }
                    }
                        
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
        }.navigationBarTitle("")
    }
}
