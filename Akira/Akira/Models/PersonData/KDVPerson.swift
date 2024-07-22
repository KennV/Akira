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
	var eMailAddress: String
	var metAt: KDVEvent?
	@Attribute(.externalStorage) var photo: Data?
	
	init(userID: String, firstName: String, midOrNoName: String, lastName: String, userDetails: String, userAchievement: String, eMailAddress: String, metAt: KDVEvent?) {
		self.userID = userID
		self.firstName = firstName
		self.midOrNoName = midOrNoName
		self.lastName = lastName
		self.userDetails = userDetails
		self.userAchievement = userAchievement
		self.eMailAddress = eMailAddress
		self.metAt = nil /**
		lets see if I don't get phantom events 20240721@1412 _*That's the kinda shit I'm talkin about*_ Realistically there are very VERY few places that could have been making new empty event
		*/
	}

	// MARK: Person Setup
	
	/** 
	### Sets randomized values for this class
	- Parameter p: Person instance to modify inline
	
	Also note that currently ALL of the midle names are from female names and that half of the people will also recieve a female first name. (*However I will not be adding a Gender to the Person Class *)
	*/
	func randomizePersonData(_ p:KDVPerson) {
		p.userID = makeRandomHexQuad()
		p.firstName = MaleNames[makeRandomNumber(UInt32(MaleNames.count))]
		p.midOrNoName =  FemaleNames[makeRandomNumber(UInt32(FemaleNames.count))]
		p.lastName =  LastNames[makeRandomNumber(UInt32(LastNames.count))]
		p.userDetails =  "nil"
		p.userAchievement =  "nil"
		if (makeRandomNumber(100) <= 50) {
			p.firstName = FemaleNames[makeRandomNumber(UInt32(FemaleNames.count))]
		}
	}
	
	// MARK: Utilities
	func makeRandomHexQuad() -> String {
		var hex = String()
		for _ in 1...4 {
			let x = HexDigits[makeRandomNumber(UInt32(HexDigits.count))]
			hex.append(x)
		}
		return hex
	}
	
	/**
	### flat random number generator
	 
	- Parameter range: Positve Number
	- Returns: Random Number
	*/
	func makeRandomNumber(_ range: UInt32) ->Int {
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
private let FemaleNames: [String] = ["Jessica", "Ashley", "Amanda", "Sarah", "Jennifer", "Brittany", "Stephanie", "Samantha", "Nicole", "Elizabeth", "Lauren", "Megan", "Tiffany", "Heather", "Amber", "Melissa", "Danielle", "Emily", "Rachel", "Kayla"]
private let MaleNames: [String] = ["Michael", "Christopher", "Matthew", "Joshua", "Andrew", "David", "Justin", "Daniel", "James", "Robert", "John", "Joseph", "Ryan", "Nicholas", "Jonathan", "William", "Brandon", "Anthony", "Kevin", "Eric"]
private let LastNames: [String] = ["Cero", "Uno", "Dos", "Tres", "Quatro", "Cinco", "Seis",   "Siete", "Ocho", "Nueve", "Diez", "Once", "Doce", "Triece", "Catorce", "Quince", "Diesiseis", "Dies y Siete", "Diez y Ochco", "Diez y Nueve"]
private let HexDigits: [String] = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
	
}
