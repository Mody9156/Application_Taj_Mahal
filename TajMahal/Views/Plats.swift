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
        Section("Plats Principaux") {// titre de la setion
            ForEach(viewModel.mainCourseArray ,id:\.id){ mainCourse in
                NavigationLink {
                    Image("\(mainCourse.imageName)").resizable().frame(width: 128.84,height: 86).cornerRadius(10)
                } label: {
                    
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