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
            
            VStack(alignment: .leading){
                
                Image("TajMahal").resizable().frame(width: 335,height: 423)//picture for the view
                
              
                
                HStack(spacing: 170){
                    
                    VStack (alignment: .leading) {
                        
                        Text("Restaurant Indien").font(.custom("PlusJakartaSans-400.ttf", size: 15)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0))
                        Text("Taj Mahal").font(.custom("PlusJakartaSans-wgt.ttf",size:18)).foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255, opacity: 1.0))
                    }
                    
                    Image("Logo").resizable().renderingMode(.template).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0)).frame(width: 39.99,height: 40)
                }.padding(10)
                
           
                
                VStack (alignment: .leading){
                    
                    ForEach(ArrayBottomView,id:\.self){ Array in
                        
                        BottomView(name: Array.name, img: Array.img, moreNews: Array.moreNews).padding(5)// éléments de la struct BottomView  ⇣

                    }
                    
                }
                
              
                
                NavigationLink {
                    
                    MenuView()
                    
                } label : {
                    ZStack {
                        Rectangle().frame(width: 335,height: 40).cornerRadius(10).foregroundColor(Color(red: 207/255, green: 47/255, blue: 47/255, opacity: 1.0))
                        
                        Text("Accéder au menu").fontWeight(.bold).foregroundColor(.white)
                    }
                    
                }.navigationBarTitle("").padding(10)
               
            }
            
        }


    }
}

let ArrayBottomView = [ BottomView(name: "Mardi", img: "Horaire", moreNews: "11h30-14h30·18h30-22h00"),
                        BottomView(name: "Type de Service", img: "Service", moreNews: "À emporter"),
                        BottomView(name: "12 Avenue de la Brique - 75010 Paris ", img: "Localisation", moreNews: ""),
                        BottomView(name: "www.tajmahal.fr", img: "Site", moreNews: ""),
                        BottomView(name: "06 12 34 56 78", img: "Téléphone", moreNews: "")]
                        // éléments de la struct BottomView  ⇣


struct BottomView: View ,Hashable{

    var name:String //@State de la variable dans la struct WelcomeView ⇡
    var img:String //@State de la variable dans la struct WelcomeView ⇡
    var moreNews:String //@State de la variable dans la struct WelcomeView ⇡
    
    var body: some View {
       
        HStack(spacing : Spacing(for:name) ){ // utilisation de la  function Spacing ⇣

            Label(name, image: img).font(.custom("PlusJakartaSans-600.ttf", size: 12)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0))

                Text(moreNews).font(.custom("PlusJakartaSans-600.ttf", size: 12)).foregroundColor(Color(red: 154/255, green: 154/255, blue: 154/255, opacity: 1.0))

        }
        
    }
  
}

private func Spacing(for name : String) -> CGFloat { // CGFloat pour type float
    switch name {
    case "Mardi" :
        return 134
    case "Type de Service":
        return 162
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
