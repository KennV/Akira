
import Foundation
import SwiftData

@MainActor

struct KDVPreviewer {
	let container: ModelContainer
	let e: KDVEvent
	let p: KDVPerson
	
	init() throws {
		let config = ModelConfiguration(isStoredInMemoryOnly: true)
		container = try ModelContainer(for: KDVPerson.self, configurations: config)

		e = KDVEvent(name: "Dimension Jump", location: "Nottingham")

		p  = KDVPerson(userID: "", firstName: "nil", midOrNoName: "", lastName: "nil", userDetails: "", userAchievement: "", eMailAddress: "Nil@NULL-AF.com", metAt: e)
		p.randomizePersonData(p)
		p.firstName = "Dave"
		p.lastName = "Lister"
		p.eMailAddress = "dave@reddwarf.com"


		container.mainContext.insert(p)
	}
}
