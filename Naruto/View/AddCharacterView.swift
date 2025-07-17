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
    @State private var assistant: String = ""
    
    @State private var taidzusu: Int64 = 0
    @State private var ninjutsu: Int64 = 0
    @State private var genjutsu: Int64 = 0
    @State private var power: Int64 = 0
    @State private var intelligence: Int64 = 0
    
    var body: some View {
           NavigationView {
               Form {
                   Section(header: Text("Basic information")) {
                       TextField("Name", text: $name)
                       TextField("Clan", text: $clan)
                       TextField("Village", text: $village)
                       TextField("Element", text: $element)
                       TextField("Special Power", text: $specialPower)
                       TextField("Friend/Enemy", text: $assistant)
                   }.foregroundStyle(.primary)

                   Section(header: Text("Skills")) {
                       Stepper("Taijutsu: \(taidzusu)", value: $taidzusu, in: 0...100)
                       Stepper("Ninjutsu: \(ninjutsu)", value: $ninjutsu, in: 0...100)
                       Stepper("Genjutsu: \(genjutsu)", value: $genjutsu, in: 0...100)
                       Stepper("Power: \(power)", value: $power, in: 0...100)
                       Stepper("Intelligence: \(intelligence)", value: $intelligence, in: 0...100)
                   }.foregroundStyle(.primary)

                   Section(header: Text("Image")) {
                       TextField("URL image", text: $imageURL)
                   }
               }.foregroundStyle(.primary)
               .navigationTitle("Новый персонаж")
               .toolbar {
                   ToolbarItem(placement: .confirmationAction) {
                       Button("Сохранить") {
                           addCharacter()
                       }
                   }

                   ToolbarItem(placement: .cancellationAction) {
                       Button("Отмена") {
                           dismiss()
                       }
                   }
               }
           }.backgroundStyle(Color(.systemBackground))
       }
    
    private func addCharacter() {
        let newItem = Item(context: viewContext)
        
        newItem.name = name
        newItem.clan = clan
        newItem.element = element
        newItem.village = village
        newItem.imageURL = imageURL
        newItem.specialPower = specialPower

        newItem.taidzusu = taidzusu
        newItem.ninjutsu = ninjutsu
        newItem.gendzusu = genjutsu
        newItem.power = power
        newItem.intelligence = intelligence
        
        newItem.id = Int64(UUID().hashValue)
        
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print("❌ Ошибка при сохранении: \(error.localizedDescription)")
        }
    }
}



