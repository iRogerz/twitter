//
//  PofileHeaderViewModel.swift
//  twitter
//
//  Created by 曾子庭 on 2022/8/2.
//

import Foundation
import UIKit

enum PofileFilterOptions: Int, CaseIterable {
    case tweets = 0
    case replies
    case likes
    
    var destription: String{
        switch self{
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct PofileHeaderViewModel {
    private let user: User
    
    var followersString: NSAttributedString{
        return attributedText(value: 0, text: "Followers")
    }
    var followeringString: NSAttributedString{
        return attributedText(value: 2, text: "Following")
    }
    
    var actionButtonTitle: String{
        //if user is current user then set to edit pofile
        //else figure out following/not gollowing
        if user.isCurrentUser {
            return "Edit Pofile"
        }else{
            return "Follow"
        }
    }
    
    //存取權限但我還沒研究
    fileprivate func attributedText(value: Int, text: String) -> NSAttributedString{
        let attributedTitle = NSMutableAttributedString(string: "\(value) ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedTitle.append(NSAttributedString(string: text, attributes: [.font: UIFont.systemFont(ofSize: 14),                                                                            .foregroundColor: UIColor.lightGray]))
        return attributedTitle
    }
    
    init(user: User){
        self.user = user
    }
}
