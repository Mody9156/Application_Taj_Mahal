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
            
            VStack {
                
                List {
                    
                   
                    Entree().listRowBackground(Color.clear).listSectionSeparator(.hidden, edges: .bottom)//incrémentation des entrées sous forme de liste
                    
                    Plats()//incrémentation des plats sous forme de liste
                    
                }
            }.navigationBarTitle("Menu").listStyle(.plain)

        }
    }
        

}
