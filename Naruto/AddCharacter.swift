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
                   Section(header: Text("Основная информация")) {
                       TextField("Имя", text: $name)
                       TextField("Клан", text: $clan)
                       TextField("Деревня", text: $village)
                       TextField("Элемент", text: $element)
                       TextField("Спец. способность", text: $specialPower)
                       TextField("Друг/Враг", text: $assistant)
                   }

                   Section(header: Text("Навыки")) {
                       Stepper("Тайдзюцу: \(taidzusu)", value: $taidzusu, in: 0...100)
                       Stepper("Ниндзюцу: \(ninjutsu)", value: $ninjutsu, in: 0...100)
                       Stepper("Гендзюцу: \(genjutsu)", value: $genjutsu, in: 0...100)
                       Stepper("Сила: \(power)", value: $power, in: 0...100)
                       Stepper("Интеллект: \(intelligence)", value: $intelligence, in: 0...100)
                   }

                   Section(header: Text("Изображение")) {
                       TextField("URL изображения", text: $imageURL)
                   }
               }
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
           }
       }
    
    private func addCharacter() {
        let newItem = Item(context: viewContext)
        
        newItem.name = name
        newItem.clan = clan
        newItem.gendzusu = genjutsu
        newItem.assistant = assistant
        newItem.imageURL = imageURL
        newItem.taidzusu = taidzusu
        
    }
}
