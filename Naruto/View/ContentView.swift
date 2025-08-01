
import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // Получаем всех персонажей из Core Data
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.name)], // сортировка по имени
        animation: .default)
    
    //result request
    private var characters: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(characters) { character in
                    VStack(alignment: .leading) {
                        Text(character.name ?? "No name")
                            .font(.headline)
                        Text("Clan: \(character.clan ?? "Unknown")")
                            .font(.subheadline)
                        Text("Element: \(character.element ?? "Unknown")")
                            .font(.subheadline)
                        Text("Village: \(character.village ?? "Unknown")")
                            .font(.subheadline)
                        Text("Special Power: \(character.specialPower ?? "Unknown")")
                            .font(.subheadline)
                        Text("Assistant: \(character.assistant ?? "Unknown")")
                            .font(.subheadline)
                        Text("Taidzusu: \(character.taidzusu ?? 0)")
                            .font(.subheadline)
                        Text("Ninjutsu: \(character.ninjutsu ?? 0)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Персонажи")
            .toolbar {
                NavigationLink("Добавить", destination: AddCharacterView())
            }
        }
    }
}
