/**

	KDVEvent.swift
	Akira
	Created by Kenn Villegas on 7/13/24.

*/


import Foundation
import SwiftData

@Model
class KDVEvent {
	var name: String = ""
	var location: String = ""
	var people: [KDVPerson]? = [KDVPerson]()
	
	init(name: String, location: String) {
		self.name = name
		self.location = location
	}
}
