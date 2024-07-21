/**
		KDVPeopleView.swift
		Akira

		Created by Kenn Villegas on 7/21/24.

*/
import SwiftUI
import SwiftData

struct KDVPeopleView: View {
	@Environment(\.modelContext) var modelContext
	@Query var people: [KDVPerson] /** Hey an Array of @Bindable Objects*/
	@State private var searchText = ""

	var body: some View{
		List {
			ForEach (people)
			{
				person in NavigationLink(value: person) {
					Text (person.firstName + " " + person.lastName)
				}
			}
			.onDelete(perform: deletePeople)
		}

	}
	
	init(searchText: String = "", sortOrder: [SortDescriptor<KDVPerson>] = []) {
		_people = Query(filter: #Predicate { person in
			if searchText.isEmpty {
				true
			} else {
				person.firstName.localizedStandardContains(searchText)
				|| person.lastName.localizedStandardContains(searchText)
				|| person.userDetails.localizedStandardContains(searchText)
			}
		}, sort: sortOrder)
	}
	
	/**
	 20240721@0311
	 */
	
	func deletePeople(at offsets: IndexSet) {
		for offset in offsets {
			let xP = people[offset]
			modelContext.delete(xP)
		}
	}
}

#Preview {
    KDVPeopleView()
}
