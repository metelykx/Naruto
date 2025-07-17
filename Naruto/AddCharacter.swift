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
    
    var body: some View {
        Text("dd")
    }
}
