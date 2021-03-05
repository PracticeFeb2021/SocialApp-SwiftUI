//
//  Stores.swift
//  SocialApp-SwiftUI
//
//  Created by Oleksandr Bretsko on 3/1/21.
//

import Combine
import Dispatch

final class PostStore: ObservableObject {
    
    @Published var posts: [Post]

    private var bag = Set<AnyCancellable>()

    init(_ posts: [Post] = []) {
        self.posts = posts
    }
    
    func loadPosts(){
        NetworkManager.shared.loadPosts()
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { [weak self] posts in
            
            DispatchQueue.main.async {
                print("received \(posts.count) posts")
                self?.posts = posts
            }
        }).store(in: &bag)
    }
}


final class UserStore: ObservableObject {
    
    @Published var users: [User]
    
    private var bag = Set<AnyCancellable>()

    init(_ users: [User] = []) {
        self.users = users
    }
    
    func loadUsers(){
        NetworkManager.shared.loadUsers()
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { [weak self] users in
            
            DispatchQueue.main.async {
                print("received \(users.count) users")
                self?.users = users
            }
        }).store(in: &bag)
    }
}


final class CommentStore: ObservableObject {
    
    @Published var comments: [Comment]
    
    private var bag = Set<AnyCancellable>()

    init(_ comments: [Comment] = []) {
        self.comments = comments
    }
    
    func loadComments(){
        NetworkManager.shared.loadComments()
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { [weak self] comments in
                
                DispatchQueue.main.async {
                    print("received \(comments.count) comments")
                    self?.comments = comments
                }
        }).store(in: &bag)
    }
}



