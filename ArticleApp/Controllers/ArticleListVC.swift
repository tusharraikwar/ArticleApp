//
//  ViewController.swift
//  ArticleApp
//
//
//

import UIKit

class ArticleListVC: UIViewController {
    @IBOutlet var viewTable: UITableView!
    
    var currentPageNo = 1
    var viewModel = ArticleListsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Articles"
        Utils.registerUItableViewCell(viewTable)
        self.setTableViewDelegatesAndDataSource()
        CallForArticleListing() //API call
    
    }
    
    private func setTableViewDelegatesAndDataSource(){
        viewTable.separatorStyle = .none
        viewTable.delegate = viewModel
        viewTable.dataSource = viewModel
        viewModel.vc = self
    }
    
    public func CallForArticleListing(){
        
        let Url = BASE_URL + "v1/blogs?page=\(currentPageNo)&limit=10"
        Utils.getArticleList(url: Url, currentPageNo: "\(currentPageNo)", viewTable: viewTable, params: [:], oauth: false) {  (arrCount) in
            dismissProgressView()
            if arrCount > 0{
                DispatchQueue.main.async {
                    self.viewTable.reloadData()
                }
            }
        }
    }

}

