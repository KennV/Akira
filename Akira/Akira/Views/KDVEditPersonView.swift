/**
	KDVEditPersonView.swift
	Akira

	Created by Kenn Villegas on 7/13/24.
*/

import PhotosUI
import SwiftUI
import SwiftData

struct KDVEditPersonView: View {
	@Environment(\.modelContext) var context
	@Bindable var p: KDVPerson
	@Binding var navPath: NavigationPath
	@State private var selectedItem: PhotosPickerItem?
	
	@Query (sort: [
		SortDescriptor(\KDVEvent.name),
		SortDescriptor(\KDVEvent.location)
	]) var events: [KDVEvent]


	var body: some View {
		Form {
			Section {
				if let imageData = p.photo, let uiImage = UIImage(data: imageData) {
					Image(uiImage: uiImage)
						.resizable()
						.scaledToFit()
				}
				
				PhotosPicker(selection: $selectedItem, matching: .images) {
					Label("Select a photo", systemImage: "person")
				}
			}
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
		.onChange(of: selectedItem, loadPhoto)
	}

	func loadPhoto() {
		Task { @MainActor in
			p.photo = try await selectedItem?.loadTransferable(type: Data.self)
		}
	}


	
	func addEvent() { // I seem to have a phantom one
		let e = KDVEvent(name: "", location: "")
		context.insert(e)
		navPath.append(e)

	} 



}
#Preview {
	do {
		let viewer = try KDVPreviewer()

		return KDVEditPersonView(p: viewer.p, navPath: .constant(NavigationPath())) .modelContainer(viewer.container)

	} catch {
		return Text("Failed to create preview: \(error.localizedDescription)")
	}
}
