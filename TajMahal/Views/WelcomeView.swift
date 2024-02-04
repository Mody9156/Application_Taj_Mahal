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
                
                VStack  {
                    
                    Text("Restaurant Indien").foregroundColor(.gray)
                    Text("Taj Mahal").font(.title).fontWeight(.bold)
                }
               
                Image("Logo").resizable().renderingMode(.template).foregroundStyle(.gray).frame(width: 40,height: 40)
            }.padding()
            
            VStack (alignment: .leading){
               
                    BottomView(name: "Mardi", img: "Horaire", moreNews: "11h30-14h30·18h30-22h00")// éléments de la struct BottomView  ⇣
                    BottomView(name: "Type de Service", img: "Service", moreNews: "À emporter")// éléments de la struct BottomView  ⇣
                    BottomView(name: "12 Avenue de la Brique - 75010 Paris ", img: "Localisation", moreNews: "")// éléments de la struct BottomView  ⇣
                    BottomView(name: "www.tajmahal.fr", img: "Site", moreNews: "")// éléments de la struct BottomView  ⇣
                    BottomView(name: "06 12 34 56 78", img: "Téléphone", moreNews: "")// éléments de la struct BottomView  ⇣
               
               
            }.padding()
            
            NavigationLink {
                MenuView()
            } label : {
                ZStack {
                    Rectangle().frame(width: 335,height: 40).cornerRadius(10).foregroundColor(.red)
                    Text("Accéder au menu").fontWeight(.bold).foregroundColor(.white)
                }
                
            }.navigationBarTitle("")
        }
        }

    }
}


struct BottomView: View {

    var name:String //@State de la variable dans la struct WelcomeView ⇡
    var img:String //@State de la variable dans la struct WelcomeView ⇡
    var moreNews:String //@State de la variable dans la struct WelcomeView ⇡

    var body: some View {

        HStack(spacing : Spacing(for : name )){ // utilisation de la  function Spacing ⇣


                Label(name, image: img).foregroundColor(.gray)

                Text(moreNews).foregroundColor(.gray)


        }
    }
}

private func Spacing(for name : String) -> CGFloat { // CGFloat pour type float
    switch name {
    case "Mardi" :
        return 50
    case "Type de Service":
        return 100
    default :
        return 0;
        // méthode  switch pour une réutilisation
    }
   
}//function de la struct BottomView ⇡



struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
