//
//  AddCharacter.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 17.07.2025.
//

import SwiftUI

struct AddCharacter: View {
    

    //for get info from CoreData and save info
    @Environment(\.managedObjectContext) private var viewContext
    
    //you can close screen after add the heroes
    @Environment(\.dismiss) private var dismiss
    
    //variables for add heroes
    @State private var name: String = ""
    @State private var clan: String = ""
    @State private var element: String = ""
    @State private var village: String = ""
    @State private var imageURL: String = ""
    @State private var specialPower: String = ""
    
    @State private var taidzusu: Int64 = 0
    @State private var ninjutsu: Int64 = 0
    @State private var genjutsu: Int64 = 0
    @State private var power: Int64 = 0
    @State private var intelligence: Int64 = 0
    
    var body: some View {
        NavigationView {
            
        }
    }
}
