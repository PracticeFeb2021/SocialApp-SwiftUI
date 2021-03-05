//
//  CommentRowView.swift
//  SocialApp-SwiftUI
//
//  Created by Oleksandr Bretsko on 3/1/21.
//

import SwiftUI

struct CommentRowView: View {
    var comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(comment.name)
                //.frame(alignment: .center)
                .lineLimit(1)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                .font(.callout)
                .padding(.leading)
                .padding(.trailing)
            
            Text(comment.body)
                .font(.caption)
                .lineSpacing(2)
            
            Spacer()
        }
    }
}

struct CommentRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CommentRowView(comment: testComments[0])
            CommentRowView(comment: testComments[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
