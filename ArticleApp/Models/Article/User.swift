//
//	User.swift
//	    

import Foundation

struct User{

	var about : String!
	var avatar : String!
	var blogId : String!
	var city : String!
	var createdAt : String!
	var designation : String!
	var id : String!
	var lastname : String!
	var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		about = dictionary["about"] as? String
		avatar = dictionary["avatar"] as? String
		blogId = dictionary["blogId"] as? String
		city = dictionary["city"] as? String
		createdAt = dictionary["createdAt"] as? String
		designation = dictionary["designation"] as? String
		id = dictionary["id"] as? String
		lastname = dictionary["lastname"] as? String
		name = dictionary["name"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if about != nil{
			dictionary["about"] = about
		}
		if avatar != nil{
			dictionary["avatar"] = avatar
		}
		if blogId != nil{
			dictionary["blogId"] = blogId
		}
		if city != nil{
			dictionary["city"] = city
		}
		if createdAt != nil{
			dictionary["createdAt"] = createdAt
		}
		if designation != nil{
			dictionary["designation"] = designation
		}
		if id != nil{
			dictionary["id"] = id
		}
		if lastname != nil{
			dictionary["lastname"] = lastname
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}

}
