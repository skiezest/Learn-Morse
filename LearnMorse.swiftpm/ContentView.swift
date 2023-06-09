import SwiftUI

struct ContentView: View {
    @AppStorage("showsHelp") var showsHelp: Bool = true
    
    var body: some View {
        TabView {
            TypeView(showsHelp: $showsHelp)
                .tabItem {
                    Label("Type", systemImage: "textformat.size")
                }
            ListenView()
                .tabItem {
                    Label("Listen", systemImage: "speaker.wave.2.fill")
                }
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "list.bullet")
                }
        }
        .tint(.blue)
        .sheet(isPresented: $showsHelp) {
            OnboardingView()
        }
    }
}
