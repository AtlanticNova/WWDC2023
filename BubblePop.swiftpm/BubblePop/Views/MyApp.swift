import SwiftUI

@main
struct MyApp: App {
    @StateObject var audio = Audio()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audio)
        }
    }
}
