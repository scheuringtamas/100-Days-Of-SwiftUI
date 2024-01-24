import SwiftUI

struct HorizontalScrollView: View {
    let crew: [MissionView.CrewMember]
    @State private var selectedAstronaut: Astronaut?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(
                        destination: AstronautView(astronaut: crewMember.astronaut),
                        tag: crewMember.astronaut,
                        selection: $selectedAstronaut
                    ) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    let mission = missions[0]
    let crew: [MissionView.CrewMember] = mission.crew.map { member in
        if let astronaut = astronauts[member.name] {
            return MissionView.CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }

    return HorizontalScrollView(crew: crew)
        .preferredColorScheme(.dark)
}


