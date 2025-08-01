
import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("useGrayText") var useGray = false
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
                        Text("Power: \(character.power ?? 0)")
                            .font(.subheadline)
                        Text("Intelligence: \(character.intelligence ?? 0)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Heroes")
            .toolbar {
                NavigationLink("Add", destination: AddCharacterView())
            }
        }
    }
}
