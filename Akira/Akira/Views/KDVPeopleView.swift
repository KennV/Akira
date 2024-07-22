/**
		KDVPeopleView.swift
		Akira

		Created by Kenn Villegas on 7/21/24.

*/
import SwiftUI
import SwiftData

struct KDVPeopleView: View {
	
	@Environment(\.modelContext) var modelContext
	@Query var pArr: [KDVPerson]
	@State private var searchText = ""

	var body: some View{
		List {
			ForEach (pArr)
			{
				p in NavigationLink(value: p) {
					Text (p.firstName + " " + p.lastName)
				}
			}
			.onDelete(perform: deletePeople)
		}
	}
	
	init(searchText: String = "", sortOrder: [SortDescriptor<KDVPerson>] = []) {
		_pArr = Query(filter: #Predicate { p in
			if searchText.isEmpty {
				true
			} else {
				p.firstName.localizedStandardContains(searchText)
				|| p.lastName.localizedStandardContains(searchText)
				|| p.userDetails.localizedStandardContains(searchText)
			}
		}, sort: sortOrder)
	}
	
	/// I Delete KDVPeople
	/// - Parameter offsets: Indices for People\Objs
	func deletePeople(at offsets: IndexSet) {
		for offset in offsets {
			let xP = pArr[offset]
			modelContext.delete(xP)
		}
	}
}

#Preview {
    KDVPeopleView()
}
