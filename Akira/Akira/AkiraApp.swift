/**
	AkiraApp.swift
	Akira
	Created by Kenn Villegas on 7/13/24.
 */

import SwiftUI
import SwiftData

@main
struct AkiraApp: App {
	var body: some Scene {
		WindowGroup {
			KDVMainView()
		}
	.modelContainer(for: KDVPerson.self)
	}
}

