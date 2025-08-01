
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
