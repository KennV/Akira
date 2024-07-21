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
//	var peopleView: KDVPeopleView?

	var body: some View {
		NavigationStack(path: $path) {
			KDVPeopleView(searchText: searchString)
			.navigationTitle("Titties!")
			.navigationDestination(for: KDVPerson.self) { 
				person in KDVEditPersonView(person: person)
			}
			.toolbar {
				Button ("add person", systemImage: "plus", action: addPerson)
					.searchable(text: $searchString)
			}
		}
	}
	
	func addPerson() {
		let newPerson = KDVPerson(userID: "unset", firstName: "nil", midOrNoName: "nil", lastName: "nil", userDetails: "unset", userAchievement: "unset")
		newPerson.randomizePersonData(newPerson)
		
		modelContext.insert(newPerson)
		path.append(newPerson)
	}
	
//	func deletePeople(at offsets: IndexSet) {
//		for offset in offsets {
//			let xP = people[offset]
//			modelContext.delete(xP)
//		}
//	}
	
}

#Preview {
	KDVMainView()
}
