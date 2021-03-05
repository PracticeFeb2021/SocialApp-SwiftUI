//
//  ContentView.swift
//  SocialApp-SwiftUI
//
//  Created by Oleksandr Bretsko on 3/1/21.
//

import SwiftUI

struct PostListView: View {
    
    @StateObject var postStore = PostStore()
    
    var posts: [Post] {
        postStore.posts
    }
    
    private let loadPostsOnAppear: Bool
    
    init(loadPostsOnAppear: Bool = true) {
        self.loadPostsOnAppear = loadPostsOnAppear
    }
    
    var body: some View {
        
        Text("Posts")
            .font(.title)
            .padding(.top)
        
        NavigationView {
            List(postStore.posts) { post in
                NavigationLink(destination: PostView(post)) {
                    PostRowView(post: post)
                }
            }
        }
        .onAppear {
            if loadPostsOnAppear {
                postStore.loadPosts()
            }
        }
    }
    
    func loadPosts() {
        postStore.loadPosts()
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        let view = PostListView(loadPostsOnAppear: true)
        //view.postStore.posts = testPosts
        return view
    }
}

