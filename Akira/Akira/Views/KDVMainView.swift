/**
	ContentView.swift
	Akira

	Created by Kenn Villegas on 7/13/24.

*/

import SwiftData
import SwiftUI

struct KDVMainView: View {
	
	// MARK: DATA STUBS
	/**
	Apparently these are also inthe correct order
	 */
	@Environment(\.modelContext) var modelContext
	@State private var path = NavigationPath()
	@State private var searchString = ""
	@State private var sortOrder = [SortDescriptor (\KDVPerson.firstName)]

	var body: some View {
		NavigationStack(path: $path) {
			KDVPeopleView(searchText: searchString, sortOrder: sortOrder)
			.navigationTitle("People Tracker!")
			.navigationDestination(for: KDVPerson.self) {
				person in KDVEditPersonView(p: person, navPath: $path)
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
		let p = KDVPerson(userID: "unset", firstName: "nil", midOrNoName: "nil", lastName: "nil", userDetails: "unset", userAchievement: "unset", eMailAddress: "Jive", metAt: KDVEvent(name: "", location: ""))
	p.randomizePersonData(p)
		modelContext.insert(p)
		path.append(p)
	}
}


#Preview {
	do {
		let p = try KDVPreviewer()
		return KDVMainView()
			.modelContainer(p.container)
	} catch {
		return Text("Failed to create preview: \(error.localizedDescription)")
	}
}
