/**
	KDVEditPersonView.swift
	Akira

	Created by Kenn Villegas on 7/13/24.
*/

import SwiftUI
import SwiftData

struct KDVEditPersonView: View {
	@Environment(\.modelContext) var context
	@Bindable var p: KDVPerson
	@Binding var navPath: NavigationPath
	// Photos Soon?
	@Query (sort: [
		SortDescriptor(\KDVEvent.name),
		SortDescriptor(\KDVEvent.location)
	]) var events: [KDVEvent]
	
	var body: some View {
		Form {
			Section {
				VStack {
					HStack {
						TextField ("fName: ", text: $p.firstName)
						TextField ("lName: ", text: $p.lastName )
					}
					TextField ("uID: ", text: $p.userID)
				}
			}
			
			Section ("Where did we meet:") {
				Picker("Met at: ", selection: $p.metAt) {
					Text("Unknown Event")
						.tag(Optional<KDVEvent>.none)
					
					if events.isEmpty == false {
						Divider()
						ForEach (events) { event in
							Text(event.name)
								.tag(Optional(event))
						}

					}
				}
			}
			Button("Add a new event", action: addEvent)
			
			Section("Persons Details") {
				TextField ("Details: ", text: $p.userDetails, axis: .vertical)
			}
		}
		.navigationTitle("Edit Person:")
		.navigationBarTitleDisplayMode(.inline)
		.navigationDestination(for: KDVEvent.self) { event in
			KDVEditEventView(event: event)
		}
	}


	func addEvent() {
		let e = KDVEvent(name: "", location: "")
		context.insert(e)
		navPath.append(e)

	}



}
//#Preview {
//	KDVEditPersonView()
//}

