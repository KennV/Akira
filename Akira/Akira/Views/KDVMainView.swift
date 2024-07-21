/**
	ContentView.swift
	Akira

	Created by Kenn Villegas on 7/13/24.

*/

import SwiftData
import SwiftUI

struct KDVMainView: View {

	@Environment(\.modelContext) var modelContext
	@State private var path = [KDVPerson]()
	@State private var searchString = ""
	@State private var sortOrder = [SortDescriptor (\KDVPerson.firstName)]

	var body: some View {
		NavigationStack(path: $path) {
			KDVPeopleView(searchText: searchString, sortOrder: sortOrder)
			.navigationTitle("Titties!")
			.navigationDestination(for: KDVPerson.self) {
				person in KDVEditPersonView(person: person)
			}
			.toolbar {
				Menu ("Sort", systemImage: "arrow.up.arrow.down") {
					Picker("Sort", selection: $sortOrder) {
						Text("Name (A-Z)")
							.tag([SortDescriptor(\KDVPerson.firstName)])

						Text("Name (Z-A)")
							.tag([SortDescriptor(\KDVPerson.firstName, order: .reverse)])
					}
				}
				Button ("add person", systemImage: "plus", action: addPerson)
					.searchable(text: $searchString)
			}
		}
	}

	func addPerson() {
		let newPerson = KDVPerson(userID: "unset", firstName: "nil", midOrNoName: "nil", lastName: "nil", userDetails: "unset", userAchievement: "unset", eMailAddress: "Jive")
	newPerson.randomizePersonData(newPerson)
		modelContext.insert(newPerson)
		path.append(newPerson)
	}
}


#Preview {
	KDVMainView()
}
