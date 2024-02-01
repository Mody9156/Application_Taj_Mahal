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
    @State var icone : String = ""
    @State var moreNews  : String = ""
    var body: some View {
      
        VStack {
            Text("e")
            ScrollView {
                NavigationStack {
                    VStack{
                        Image("TajMahal").frame(width: 335,height: 423)//picture for the view

                        HStack {
                            Spacer()
                            VStack (alignment: .leading) {

                                Text("Restaurant Indien").foregroundColor(.gray)
                                Text("Taj Mahal").font(.title).fontWeight(.bold)

                            }

                            Image("Logo").resizable().renderingMode(.template).foregroundStyle(.gray).frame(width: 40,height: 40)
                            Spacer()

                        }
//                        VStack(alignment: .leading) {
//                            BottomView(name: "Mardi", icone: "clock", moreNews: "11h30 - 14h30 · 18h30 - 22h00")
//                            BottomView(name: "Type de Service", icone: "globe", moreNews: "a emporter")
//                            BottomView(name: "12 Avenue de la Brique - 75010 Paris ", icone: "globe", moreNews: "")
//                            BottomView(name: "www.tajmahal.fr", icone: "globe", moreNews: "")
//                        }

                        Spacer()
                        NavigationLink {
                            MenuView()
                        } label : {
                            ZStack {
                                Rectangle().frame(width: 335,height: 40).cornerRadius(10).foregroundColor(.red)
                                Text("Accéder au menu").fontWeight(.bold).foregroundColor(.white)
                            }

                        }.navigationTitle("")
                    }
                }
            }
        }
    }
}

//
//struct BottomView: View {
//
//    var name:String
//    var icone:String
//    var moreNews:String
//
//    var body: some View {
//
//        Group{
//            HStack {
//
//                Label(name, systemImage: icone).foregroundColor(.gray)
//
//
//                Text(moreNews).foregroundColor(.gray)
//
//
//            }.padding(5)
//
//        }
//    }
//}
