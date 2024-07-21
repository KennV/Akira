/**
	ContentView.swift
	Akira

	Created by Kenn Villegas on 7/13/24.
*/

import SwiftData
import SwiftUI

struct KDVMainView: View {
	
	@Environment(\.modelContext) var modelContext
	@Query var people: [KDVPerson] /** Hey an Array of @Bindable Objects*/
	@State private var path = [KDVPerson]()
	
	var body: some View {
		NavigationStack(path: $path) {
			List {
				ForEach (people) 
				{
					person in NavigationLink(value: person) {
					Text (person.firstName + " " + person.lastName)
					}
				}
			}
			.navigationTitle("Titties!")
			.navigationDestination(for: KDVPerson.self) { person in KDVEditPersonView(person: person)
			}
			.toolbar {
				Button ("add person", systemImage: "plus", action: addPerson)
			}
		}
	}
	
	func addPerson() {
		let newPerson = KDVPerson(userID: "unset", firstName: "nil", midOrNoName: "nil", lastName: "nil", userDetails: "unset", userAchievement: "unset")
		newPerson.randomizePersonData(newPerson)
		
		modelContext.insert(newPerson)
		path.append(newPerson)
	}
}

#Preview {
	KDVMainView()
}
