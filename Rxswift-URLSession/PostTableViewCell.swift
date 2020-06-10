//
//  PostTableViewCell.swift
//  Rxswift-URLSession
//
//  Created by Shaza Hassan on 6/10/20.
//  Copyright © 2020 Shaza Hassan. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var postId: UILabel!
    @IBOutlet weak var userId: UILabel!
    
    var post: PostModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell() {
        title.text = post?.title
        body.text = post?.body
        postId.text = "\(post?.id)"
        userId.text = "\(post?.userId)"
    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
