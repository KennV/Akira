/**
	KDVPerson.swift
	Akira
	Created by Kenn Villegas on 7/13/24.
*/

import Foundation
import SwiftData
// MARK: Strings
let femaleNames: [String] = ["Jessica", "Ashley", "Amanda", "Sarah", "Jennifer", "Brittany", "Stephanie", "Samantha", "Nicole", "Elizabeth", "Lauren", "Megan", "Tiffany", "Heather", "Amber", "Melissa", "Danielle", "Emily", "Rachel", "Kayla"]
let maleNames: [String] = ["Michael", "Christopher", "Matthew", "Joshua", "Andrew", "David", "Justin", "Daniel", "James", "Robert", "John", "Joseph", "Ryan", "Nicholas", "Jonathan", "William", "Brandon", "Anthony", "Kevin", "Eric"]
let lastNames: [String] = ["Cero", "Uno", "Dos", "Tres", "Quatro", "Cinco", "Seis",   "Siete", "Ocho", "Nueve", "Diez", "Once", "Doce", "Triece", "Catorce", "Quince", "Diesiseis", "Dies y Siete", "Diez y Ochco", "Diez y Nueve"]
@Model
class KDVPerson {
	var userID: String
	var firstName: String
	var midOrNoName: String
	var lastName: String
	var userDetails: String
	var userAchievement: String
	
	init(userID: String, firstName: String, midOrNoName: String, lastName: String, userDetails: String, userAchievement: String) {
		self.userID = userID
		self.firstName = firstName
		self.midOrNoName = midOrNoName
		self.lastName = lastName
		self.userDetails = userDetails
		self.userAchievement = userAchievement
	}
}
