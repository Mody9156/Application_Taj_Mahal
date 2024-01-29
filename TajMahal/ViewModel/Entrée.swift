//
//  Entrée.swift
//  TajMahal
//
//  Created by KEITA on 29/01/2024.
//

import Foundation
import SwiftUI

struct Entree{
    
        NavigationLink {
            Image("\(apetizer.imageName)").resizable().aspectRatio(contentMode: .fit).frame(width: 112,height: 86).cornerRadius(10)
        } label: {
            HStack {
                Image("\(apetizer.imageName)").resizable().frame(width: 128.84,height: 86).cornerRadius(10)
                
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
