import SwiftUI
import AVKit

//struct Button<highScore> where highScore: View
//struct Button<highScore> where highScore: View

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("HolographicBackgroundImg")
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .cornerRadius(20)
                        .shadow(color:.white, radius: 10)
                        .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 4)))
                        .padding(.bottom)

                        NavigationLink(
                            destination: {
                                SettingsView()
                            }, label: {
                                Text("PLAY")
                                    .foregroundColor(Color(red: 106/255, green: 163/255, blue: 241/255))
                                    .padding(.init(top: 10, leading: 135, bottom: 10, trailing: 135))
                            }
                        )
                        .font(.system(size: 52, weight: .bold))
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(color: .white, radius: 10)
                    
//                    NavigationLink(
//                        destination: {
//                            BubblePopView()
//
//                        },
//                        label: {
//                            Text("New Game")
//                        }
//                    )
//                    .buttonStyle()
                            
                    
//                    NavigationLink(
//                        destination: {
//                            HighscoreView()
//                        },
//                        label: {
//                            Text("High Score")
//                        }
//                    )
//                    Text("High Score")
//                        .padding()
//                        .font(.system(size: 36))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 12)
//                                .stroke(lineWidth: 6)
//                                .frame(width: 400, height: 60)
//                                .background(.white)
//                                .cornerRadius(12)
//                        )
//                        .shadow(color: .white, radius: 10)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
