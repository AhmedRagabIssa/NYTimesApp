//
//  ViewController.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import UIKit

class MostPopularListingViewController: ParentViewController {
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    let activityIndecator = UIActivityIndicatorView()
    
    var articlesDataSource: [Article] = [] {
        didSet{
            articlesTableView.reloadData()
            activityIndecator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func setupUI() {
        // this is only to remove the tableview footer
        setupLoadingIndicator()
        articlesTableView.tableFooterView = UIView()
    }
    
    override func register() {
        articlesTableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.reusableIdentifier)
    }
    
    override func getData() {
        super.getData()
        NetworkManager.requestMostPopularArticles { (articles, error) in
            self.articlesDataSource = articles ?? []
        }
    }
    
    func setupLoadingIndicator() {
        activityIndecator.hidesWhenStopped = true
        activityIndecator.startAnimating()
        activityIndecator.style = .gray
        activityIndecator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndecator)
        activityIndecator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndecator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}

extension MostPopularListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reusableIdentifier, for: indexPath) as? ArticleTableViewCell {
            cell.configure(with: articlesDataSource[indexPath.row])
            return cell
        } else {
            fatalError("Cann't dequeue the cell ArticleTableViewCell")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

