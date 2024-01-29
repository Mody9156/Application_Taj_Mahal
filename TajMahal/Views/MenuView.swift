//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste
struct MenuView: View {
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let viewModel: ViewModel = ViewModel()
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                List {// utilisation de l'autre manière d'incrémenter un tableau avec foreach
                    
                    Entree()
                    
                    Plats()
                    
                }
            }.navigationBarTitle("Menus")

        }
    }
        

}

struct MenuView_Preview : PreviewProvider{
    static var previews :  some View {
        MenuView()
    }
}
//#Preview{
//    MenuView()
//}
