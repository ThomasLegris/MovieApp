import SwiftUI
import shared

/// Main view of app.
struct ContentView: View {
    // MARK: - Init
    init() {
        self.setupAppearance()
    }
    
    // MARK: - View
    var body: some View {
        NavigationView {
            ZStack {
                HomeView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack(spacing: 10.0) {
                                Image("ic_record")
                                    .resizable()
                                    .frame(width: 28.0, height: 28.0)
                                HStack(spacing: 0.0) {
                                    MText(text: "Movie",
                                          font: MFont.heading1)
                                    MText(text: "App",
                                          font: MFont.heading2,
                                          color: MColor.Common.lightGreen)
                                }
                                
                            }
                        }
                    }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MColor.Common.background)
            .ignoresSafeArea()
        }.preferredColorScheme(.dark) // Force pref to dark mode to show status bar in white.
    }
}

#Preview {
    ContentView()
}
