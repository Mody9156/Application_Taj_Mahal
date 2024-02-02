//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Page d'accueil
struct WelcomeView: View {
    
    @State var name :String  = ""
    @State var img : String = ""
    @State var moreNews  : String = ""
    var body: some View {
        NavigationStack {
        VStack(alignment: .center){
            Image("TajMahal").frame(width: 335,height: 423)//picture for the view
            HStack(spacing: 150){
                
                VStack (alignment: .leading) {
                    
                    Text("Restaurant Indien").foregroundColor(.gray)
                    Text("Taj Mahal").font(.title).fontWeight(.bold)
                }
               
                Image("Logo").resizable().renderingMode(.template).foregroundStyle(.gray).frame(width: 40,height: 40)
            }
            
            VStack(alignment: .center) {
               
                    BottomView(name: "Mardi", img: "Horaire", moreNews: "11h30 - 14h30 · 18h30 - 22h00")
                    BottomView(name: "Type de Service", img: "Service", moreNews: "a emporter")
                    BottomView(name: "12 Avenue de la Brique - 75010 Paris ", img: "Localisation", moreNews: "")
                    BottomView(name: "www.tajmahal.fr", img: "Site", moreNews: "")
                    BottomView(name: "06 12 34 56 78", img: "Téléphone", moreNews: "")
               
               
            }
            
            NavigationLink {
                MenuView()
            } label : {
                ZStack {
                    Rectangle().frame(width: 335,height: 40).cornerRadius(10).foregroundColor(.red)
                    Text("Accéder au menu").fontWeight(.bold).foregroundColor(.white)
                }
                
            }
        }
        }

    }
}


struct BottomView: View {

    var name:String
    var img:String
    var moreNews:String

    var body: some View {

            HStack(spacing : name == "Mardi" ?  20 : 100 ){


                Label(name, image: img).foregroundColor(.gray)

                Text(moreNews).foregroundColor(.gray)


        }
    }
}
