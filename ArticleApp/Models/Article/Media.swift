//
//	Media.swift
//	    

import Foundation

struct Media{

	var blogId : String!
	var createdAt : String!
	var id : String!
	var image : String!
	var title : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		blogId = dictionary["blogId"] as? String
		createdAt = dictionary["createdAt"] as? String
		id = dictionary["id"] as? String
		image = dictionary["image"] as? String
		title = dictionary["title"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if blogId != nil{
			dictionary["blogId"] = blogId
		}
		if createdAt != nil{
			dictionary["createdAt"] = createdAt
		}
		if id != nil{
			dictionary["id"] = id
		}
		if image != nil{
			dictionary["image"] = image
		}
		if title != nil{
			dictionary["title"] = title
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}
