//
//  List_mainCourseArray.swift
//  TajMahal
//
//  Created by KEITA on 27/01/2024.
//

import Foundation
import SwiftUI

struct mainCourse {
    let viewModel: ViewModel = ViewModel()
    List (viewModel.mainCourseArray,id:\.id){ mainCourse in
        
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
        
    }
    
}

