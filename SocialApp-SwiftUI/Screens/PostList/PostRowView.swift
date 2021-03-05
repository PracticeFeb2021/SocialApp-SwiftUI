//
//  PostRowView.swift
//  SocialApp-SwiftUI
//
//  Created by Oleksandr Bretsko on 3/1/21.
//

import SwiftUI

struct PostRowView: View {
    var post: Post
    
    var body: some View {
        VStack(spacing: 5) {
            Text(post.title)
                .lineLimit(1)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                .font(.headline)
                .padding(.leading)
                .padding(.trailing)
            
            Text(post.body)
                .lineLimit(2)
                .lineSpacing(2)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                .font(.callout)
               
            Spacer()
        }
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostRowView(post: testPosts[0])
            PostRowView(post: testPosts[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
