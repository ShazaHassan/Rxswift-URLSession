//
//  ViewController.swift
//  Rxswift-URLSession
//
//  Created by Shaza Hassan on 6/4/20.
//  Copyright © 2020 Shaza Hassan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var posts: [PostModel] = []
    let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        let client = APIClient.shared
        do{
            try client.getRecipes().subscribe(
                onNext: { result in
                    let postsModel = result as! [[String : Any]]
                    self.posts = postsModel.map {PostModel(JSON: $0) ?? PostModel()}
                    
                    print(self.posts.count)
            },
                onError: { error in
                    print(error.localizedDescription)
            },
                onCompleted: {
                    DispatchQueue.main.async {                    self.tableView.reloadData()
                    }

                    print("Completed event.")
            }).disposed(by: disposeBag)
        }
        catch{
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        cell.post = posts[indexPath.row]
        cell.configCell()
        //        cell.title.text = posts[indexPath.row].title ?? ""
        //        cell.body.text = posts[indexPath.row].body ?? ""
        //        cell.postId.text = "\(posts[indexPath.row].id)"
        //        cell.userId.text = "\(posts[indexPath.row].userId)"
        return cell
    }
}

