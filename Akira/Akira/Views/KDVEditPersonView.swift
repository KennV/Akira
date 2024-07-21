/**
	KDVEditPersonView.swift
	Akira

	Created by Kenn Villegas on 7/13/24.
*/

import SwiftUI
import SwiftData

struct KDVEditPersonView: View {
	@Bindable var person: KDVPerson
	
	var body: some View {
		Form {
			Section {
				VStack {
					HStack {
						TextField ("fName: ", text: $person.firstName)
						TextField ("lName: ", text: $person.lastName )
					}
					TextField ("uID: ", text: $person.userID)
				}
			}
			Section("D33tz") {
				TextField ("Details: ", text: $person.userDetails, axis: .vertical)
			}
		}
		.navigationTitle("edit person")
		.navigationBarTitleDisplayMode(.inline)
	}
	/**
	20240721@0203
	
	*/
}
//#Preview {
//	KDVEditPersonView()
//}

