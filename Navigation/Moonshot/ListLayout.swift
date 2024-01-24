import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var selectedMission: Mission?
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink(
                   destination: MissionView(mission: mission, astronauts: astronauts),
                   tag: mission,
                   selection: $selectedMission
               )  {
                    HStack {
                        Spacer()
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()

                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                            
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                    )
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        .background(Color.darkBackground.edgesIgnoringSafeArea(.all)) // Set background color for the entire view


    }
}

#Preview {
    ListLayout()
}
