//
//  PostView.swift
//  SocialApp-SwiftUI
//
//  Created by Oleksandr Bretsko on 3/1/21.
//

import SwiftUI


struct PostView: View {
    
    var post: Post
    
    @StateObject var userStore = UserStore()
    @StateObject var commentStore = CommentStore()
    
    var comments: [Comment] {
        commentStore.comments
    }
    var user: User? {
        userStore.users.first(where: {
            $0.id == post.userId
        })
    }
    private let loadDataOnAppear: Bool
    
    init(_ post: Post,
         loadDataOnAppear: Bool = true) {
        self.post = post
        self.loadDataOnAppear = loadDataOnAppear
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,
                   spacing: 10) {
               
                Text(post.title)
                    .font(.headline)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                
            Text(post.body)
                .font(.footnote)
            
                HStack(alignment: .center,
                       spacing: 10) {
                    Text("Author: ")
                        .font(.footnote)
                    Text(user?.name ?? "unknown")
                        .font(.footnote)
                }
            }
            
            
            Text("Comments")
                .font(.headline)
                .padding(.top)
                .padding(.bottom)
            //.frame(alignment: .center)
            
            //                VStack(alignment: .leading,
            //                       spacing: 5) {
            ForEach(comments) { comment in
                CommentRowView(comment: comment)
            }
            //                }
            
        }.padding(.leading)
        .padding(.trailing).onAppear() {
            if loadDataOnAppear {
                userStore.loadUsers()
                commentStore.loadComments()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let view = PostView(testPost,
                            loadDataOnAppear: false)
        view.userStore.users.append(testUser)
        view.commentStore.comments = testComments
        return view
    }
}


