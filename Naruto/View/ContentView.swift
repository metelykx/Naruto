
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
                        Text(character.name ?? "Без имени")
                            .font(.headline)
                        Text("Клан: \(character.clan ?? "Неизвестно")")
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
