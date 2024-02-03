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
    
            ZStack (alignment: .topTrailing){
                
                Image("\(mainCourse.imageName)").resizable().aspectRatio(contentMode: .fill).frame(width: 335,height: 467).cornerRadius(11)
                
                ZStack (alignment: .center){
                    
                    Rectangle().fill(Color.white).frame(width: 74, height: 22).cornerRadius(10)
                    
                    Image("\(mainCourse.spiceLevel)").frame(width: 64, height: 12)
                }.padding(10)
            }
            
            VStack (alignment: .leading) {
              

                VStack(alignment: .leading)  {
                    Text("Allergènes:").foregroundColor(.gray).fontWeight(.bold).multilineTextAlignment(.leading).padding(5)
                    Text(mainCourse.allergens).foregroundColor(.gray).multilineTextAlignment(.leading)
                }
               
                Divider().frame(width: 335,height: 2)
             
                VStack (alignment: .leading) {
                    Text("Ingredients:").foregroundColor(.gray).fontWeight(.bold).multilineTextAlignment(.leading).padding(5)
                    
                    Text(mainCourse.ingredients).font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.leading)
                }
               

                
            }.padding(.leading,40)
                .navigationBarTitle(Text(mainCourse.name).foregroundColor(.black))
                            
        } label: {
    
            Entreelabel(apetizer:mainCourse) // strcut  PlatsLabels ⇡
    
        }.navigationTitle("")

    }
}
