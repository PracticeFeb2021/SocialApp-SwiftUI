//
//  PostView.swift
//  SocialApp-SwiftUI
//
//  Created by Oleksandr Bretsko on 3/1/21.
//

import Foundation


let testPost = Post(id: 1, userId: 1, title: "My Post 1", body: "dasdasdasda")

fileprivate let postBody = "dasdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda asdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda asdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda asdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda asdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda dasdasdasda"

let testPosts: [Post] = {
    var r = [Post]()
    for i in 1...10 {
        let post = Post(id: 0, userId: 1,
                        title: "My Post \(i) - dasdasdasda dasdasdasda dasdasdasda",
                        body: postBody)
        r.append(post)
    }
    return r
}()


let testComments = [
    Comment(id: 0, postId: 0, name: "My comment 1", body: postBody, email: "dasdas@asda"),
    Comment(id: 1, postId: 0, name: "My comment 2", body: postBody, email: "dasdas@asda")
]
let testUser = User(id: 1, name: "Michael", username: "User11", email: "das@eawd", address: Address(street: "Dasdas St", suite: "dasdas", city: "Kyiv", zipcode: "312", geo: Address.Geo(lat: "", lng: "")), phone: "fdsdsdsa", website: "dasdasdsa.com", company: Company(name: "Big company", catchPhrase: "dasda", bs: "dasdas"))
