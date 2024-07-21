/**
	KDVPerson.swift
	Akira
	Created by Kenn Villegas on 7/13/24.
*/

import Foundation
import SwiftData

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
	
	// MARK: Utilities
	func randomizePersonData(_ p:KDVPerson) {
		p.userID = makeRandomHexQuad()
		p.firstName = maleNames[makeRandomNumber(UInt32(maleNames.count))]
		p.midOrNoName =  femaleNames[makeRandomNumber(UInt32(femaleNames.count))]
		p.lastName =  lastNames[makeRandomNumber(UInt32(lastNames.count))]
		p.userDetails =  "nil"
		p.userAchievement =  "nil"
		if (makeRandomNumber(100) <= 50) {
			p.firstName = femaleNames[makeRandomNumber(UInt32(femaleNames.count))]
		}
	}
	
	func makeRandomHexQuad() -> String {
		var hex = String()
		for _ in 1...4 {
			let x = hexDigits[makeRandomNumber(UInt32(hexDigits.count))]
			hex.append(x)
		}
		return hex
	}
	

	/**
	### flat random number gen
	- Parameter range: Positve Number
	- Returns: Random Number
	*/
	func makeRandomNumber(_ range: UInt32) ->Int
	{
		if (range <= 1) {
			return(0)
		}
		return Int(arc4random_uniform(range))
	}
	/**
	### DnD Style Random Number Generator.
	
	- parameter rolls: Numer of rolls of range
	- parameter range: range of the random number
	
	- returns: a bell shaped random curve
	*/
	func makeRandomNumberCurve(_ rolls: Int,_ range: UInt32) ->Int
	{
		var dwell = 0
		for _ in 1...rolls {
			dwell += makeRandomNumber(range)
		}
		return dwell
	}

// MARK: Strings
private let femaleNames: [String] = ["Jessica", "Ashley", "Amanda", "Sarah", "Jennifer", "Brittany", "Stephanie", "Samantha", "Nicole", "Elizabeth", "Lauren", "Megan", "Tiffany", "Heather", "Amber", "Melissa", "Danielle", "Emily", "Rachel", "Kayla"]
private let maleNames: [String] = ["Michael", "Christopher", "Matthew", "Joshua", "Andrew", "David", "Justin", "Daniel", "James", "Robert", "John", "Joseph", "Ryan", "Nicholas", "Jonathan", "William", "Brandon", "Anthony", "Kevin", "Eric"]
private let lastNames: [String] = ["Cero", "Uno", "Dos", "Tres", "Quatro", "Cinco", "Seis",   "Siete", "Ocho", "Nueve", "Diez", "Once", "Doce", "Triece", "Catorce", "Quince", "Diesiseis", "Dies y Siete", "Diez y Ochco", "Diez y Nueve"]
private let hexDigits: [String] = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
	
}
