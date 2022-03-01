//
//  PeopleStoriesDataModel.swift
//  MessagesDataModel
//
//  Created by Amos Gyamfi from Stream on 19/01/2022.
//

import Foundation

// Data structure
struct PeopleStoriesStructure: Identifiable { // Identifiable protocol - makes it possible to use value types that needs to have a stable notion of identity.
    var id = UUID() // A universally unique identifier to identify a particular datafield and types
    var storiesProfile: String
    var storiesImagePreview: String
    var storiesTitle: String
    var storiesUnwatched: String
    var onlineNow: String
}

// Data storage using a dictionary. A dictionary stores items with key, value pairs. The order of items is not important when using dictionaries.
let PeopleStoriesData = [
    PeopleStoriesStructure(storiesProfile: "addStory", storiesImagePreview: "https://picsum.photos/id/1005/200/300", storiesTitle: "Add to story", storiesUnwatched: "", onlineNow: ""),
    PeopleStoriesStructure(storiesProfile: "storyProfile2", storiesImagePreview: "https://picsum.photos/seed/picsum/200/300", storiesTitle: "Joyce Addai", storiesUnwatched: "", onlineNow: "status"),
    PeopleStoriesStructure(storiesProfile: "storyProfile3", storiesImagePreview: "https://picsum.photos/id/1001/200/300", storiesTitle: "Amoah Bismark", storiesUnwatched: "", onlineNow: "status"),
    PeopleStoriesStructure(storiesProfile: "storyProfile4", storiesImagePreview: "https://picsum.photos/id/1006/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: "status"),
    PeopleStoriesStructure(storiesProfile: "storyProfile5", storiesImagePreview: "https://picsum.photos/id/1009/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: ""),
    PeopleStoriesStructure(storiesProfile: "storyProfile6", storiesImagePreview: "https://picsum.photos/id/1010/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: ""),
    PeopleStoriesStructure(storiesProfile: "storyProfile7", storiesImagePreview: "https://picsum.photos/id/128/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: "status"),
    PeopleStoriesStructure(storiesProfile: "storyProfile8", storiesImagePreview: "https://picsum.photos/id/1014/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: "status"),
    PeopleStoriesStructure(storiesProfile: "storyProfile9", storiesImagePreview: "https://picsum.photos/id/1015/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: ""),
    PeopleStoriesStructure(storiesProfile: "storyProfile10", storiesImagePreview: "https://picsum.photos/id/102/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: ""),
    PeopleStoriesStructure(storiesProfile: "storyProfile11", storiesImagePreview: "https://picsum.photos/id/1066/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: ""),
    PeopleStoriesStructure(storiesProfile: "storyProfile12", storiesImagePreview: "https://picsum.photos/id/1069/200/300", storiesTitle: "Akua Carla", storiesUnwatched: "", onlineNow: ""),
    PeopleStoriesStructure(storiesProfile: "storyProfile11", storiesImagePreview: "https://picsum.photos/id/1068/200/300", storiesTitle: "Amos Gyamfi", storiesUnwatched: "", onlineNow: "status"),
    PeopleStoriesStructure(storiesProfile: "storyProfile9", storiesImagePreview: "https://picsum.photos/id/1072/200/300", storiesTitle: "Zach", storiesUnwatched: "", onlineNow: ""),
    PeopleStoriesStructure(storiesProfile: "storyProfile6", storiesImagePreview: "https://picsum.photos/id/160/200/300", storiesTitle: "Brian", storiesUnwatched: "", onlineNow: "")
]
