//
//  AddCharacter.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 17.07.2025.
//

import SwiftUI
struct AddCharacterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    // Основная информация
    @State private var name: String = ""
    @State private var clan: String = ""
    @State private var element: String = ""
    @State private var village: String = ""
    @State private var specialPower: String = ""
    @State private var assistant: String = ""  // Добавлено для сохранения
    
    // Навыки (исправлены имена переменных)
    @State private var taidzusu: Int64 = 0  // Было taidzusu
    @State private var ninjutsu: Int64 = 0
    @State private var gendzusu: Int64 = 0  // Было genjutsu
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
                    TextField("Friend/Enemy", text: $assistant)  // Добавлено
                }
                
                Section(header: Text("Skills")) {
                    // Исправлены имена переменных
                    Stepper("Taijutsu: \(taidzusu)", value: $taidzusu, in: 0...100)
                    Stepper("Ninjutsu: \(ninjutsu)", value: $ninjutsu, in: 0...100)
                    Stepper("Genjutsu: \(gendzusu)", value: $gendzusu, in: 0...100)
                    Stepper("Power: \(power)", value: $power, in: 0...100)
                    Stepper("Intelligence: \(intelligence)", value: $intelligence, in: 0...100)
                }
            }
            .navigationTitle("New character")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addCharacter()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addCharacter() {
        let newItem = Item(context: viewContext)
        
        // Основная информация
        newItem.name = name
        newItem.clan = clan
        newItem.element = element
        newItem.village = village
        newItem.specialPower = specialPower
        newItem.assistant = assistant  // Сохраняем значение
        
        // Навыки (исправлены имена свойств)
        newItem.taidzusu = taidzusu  // Было taidzusu
        newItem.ninjutsu = ninjutsu
        newItem.gendzusu = gendzusu  // Было genjutsu
        newItem.power = power
        newItem.intelligence = intelligence
        
        newItem.id = Int64(UUID().hashValue)
        
        do {
            try viewContext.save()
            dismiss()
        } catch {
            // Улучшенное сообщение об ошибке
            print("❌ Core Data save error: \(error)")
            let nsError = error as NSError
            print("Detailed error: \(nsError.userInfo)")
        }
    }
}
