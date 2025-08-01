import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.name)],
        animation: .default
    ) private var characters: FetchedResults<Item>
    
    // Добавим состояние для обновления при изменении цвета
    @State private var textColorUpdated = false

    var body: some View {
        NavigationView {
            List {
                ForEach(characters) { character in
                    VStack(alignment: .leading) {
                        Text(character.name ?? "No name")
                            .titleStyle()
                        
                        Text("Clan: \(character.clan ?? "Unknown")")
                            .descriptionStyle()
                        
                        Text("Element: \(character.element ?? "Unknown")")
                            .descriptionStyle()
                        
                        Text("Village: \(character.village ?? "Unknown")")
                            .descriptionStyle()
                        
                        Text("Special Power: \(character.specialPower ?? "Unknown")")
                            .descriptionStyle()
                        
                        Text("Assistant: \(character.assistant ?? "Unknown")")
                            .descriptionStyle()
                        
                        Text("Power: \(character.power)")
                            .descriptionStyle()
                        
                        Text("Intelligence: \(character.intelligence)")
                            .descriptionStyle()
                    }
                    .id(textColorUpdated) // Принудительное обновление при изменении цвета
                }
            }
            .navigationTitle("Heroes")
            .toolbar {
                // Кнопка добавления нового персонажа
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add") {
                        AddCharacterView()
                    }
                }
                
                // Кнопка изменения цвета текста
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: toggleTextColor) {
                        Image(systemName: "paintpalette")
                    }
                }
            }
        }
    }
    
    // Функция для переключения цвета текста
    private func toggleTextColor() {
        let currentValue = UserDefaults.standard.bool(forKey: "useGrayText")
        UserDefaults.standard.set(!currentValue, forKey: "useGrayText")
        textColorUpdated.toggle() // Триггерим обновление View
    }
}
