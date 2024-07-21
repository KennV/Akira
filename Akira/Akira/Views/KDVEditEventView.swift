/**
	KDVEditEventView.swift
	Akira
	Created by Kenn Villegas on 7/21/24.
	*/
import SwiftUI
//import SwiftData

struct KDVEditEventView: View {

	@Bindable var event: KDVEvent


	var body: some View {
		Form {
			TextField("Name of Event:", text: $event.name)
			TextField("Location:", text: $event.location)
		}
		.navigationTitle("Edit Event:")
		.navigationBarTitleDisplayMode(.inline)
	}
}


//#Preview {
//	KDVEditEventView()
//}
