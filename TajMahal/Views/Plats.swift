//
//  Plats.swift
//  TajMahal
//
//  Created by KEITA on 29/01/2024.
//

import SwiftUI

struct Plats: View {
    
    let viewModel: ViewModel = ViewModel()
    let Titlesection = Text("Plats Principaux").font(.custom("PlusJakartaSans-700.ttf",size:14))
  
    var body: some View {
        Section("\(Titlesection)") {// titre de la section "plats"
            ScrollView{
                LazyVStack {
                        ForEach(viewModel.mainCourseArray ,id:\.id){  mainCourse in
                           
                               
                            
                            plats(mainCourse:mainCourse)//fonction de la struct plats ⇣
                            
                                    }
                                }
                            }
                    
        }.listStyle(.plain).listRowBackground(Color.clear).listSectionSeparator(.hidden, edges: .bottom)
            //gerer l'affichage de la list ainsi que les espaces
             
    }
    
}



struct PlatsLabels : View {//éléments affichées

    var mainCourse : Dish
    var body: some View {
     
        
            HStack{
                    
                Image("\(mainCourse.imageName)").resizable().aspectRatio(contentMode:.fill).frame(width: 112,height: 86).cornerRadius(10).padding(10)
                
                    
                    VStack(alignment: .leading) {
                        Text(mainCourse.name).lineSpacing(10).font(.system(size: 12, weight: .bold, design: .serif)).font(.custom("PlusJakartaSans-400.ttf", size: 12)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0)).padding(.bottom,5)
                            
                        Text(mainCourse.description).font(.caption2).fontWeight(.medium).font(.custom("PlusJakartaSans-400.ttf", size: 15)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0)).multilineTextAlignment(.leading)
                        
                            
                        HStack{
                            Text("\(mainCourse.price,format:.number.precision(.fractionLength(2)))€").foregroundColor(.gray).font(.custom("PlusJakartaSans-600.ttf", size: 12)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0)).bold()//format number permet de manipuler l'affichage
                            Spacer()
                            
                            Image("\(mainCourse.spiceLevel)").foregroundColor(.gray)
                            
                        }
                    }
          
            Spacer()
            
            }.frame(width: 335,height: 110).background(.white).cornerRadius(10)
                
        }
  
}

extension Plats { // extraction (suite de la struct PlatsLabels)
    
    func plats(mainCourse : Dish) ->some View { // contenue
        NavigationLink {//destination
    
            VStack{
                ZStack (alignment: .topTrailing){
                    
                    Image("\(mainCourse.imageName)").resizable().aspectRatio(contentMode:.fill).frame(width: 368,height: 560.62).cornerRadius(11)
                    
                    ZStack (alignment: .center){
                        
                        Rectangle().fill(Color.white).frame(width: 74, height: 22).cornerRadius(10)
                        
                        Image("\(mainCourse.spiceLevel)").frame(width: 64, height: 12)
                    }.padding(10)
                }
            }.padding(.leading,19).padding(.trailing,19)
          
            
            VStack (alignment: .leading) {
              

                VStack(alignment: .leading)  {
                    Text("Allergènes:").foregroundColor(.gray).fontWeight(.bold).multilineTextAlignment(.leading).padding(5).font(.system(size: 14))

                    Text(mainCourse.allergens).foregroundColor(.gray).multilineTextAlignment(.leading).font(.system(size: 12))
                }
               
                Divider().frame(width: 368,height: 2)//Ligne de séparation
             
                VStack (alignment: .leading) {
                    Text("Ingredients:").foregroundColor(.gray).fontWeight(.bold).multilineTextAlignment(.leading).padding(5).font(.system(size: 14))

                    
                    Text(mainCourse.ingredients).font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.leading).font(.system(size: 12))
                }
               

                
            }.navigationTitle(mainCourse.name).padding(.leading,20).padding(.trailing,20)
                            
        } label: {
            
            PlatsLabels(mainCourse:mainCourse) // struct  PlatsLabels ⇡
            
        }

    }
}

struct Plats_Previews: PreviewProvider {
    static var previews: some View {
        Plats()
    }
}
