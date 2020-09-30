//
//  ViewController.swift
//  ArticleApp
//
//
//

import UIKit

class ArticleListVC: UIViewController {
    @IBOutlet var viewTable: UITableView!
    var arrArticleList = [ArticleListModel]()
    var currentPageNo = 1
    var viewModel = ArticleListsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Articles"
        self.registerTableViewCells()
        self.setTableViewDelegatesAndDataSource()
        self.getArticleList() //api calles
        // Do any additional setup after loading the view.
    }
    
    private func registerTableViewCells(){
       viewTable.register(UINib(nibName:"ArticleUserNameTableCell", bundle: nil), forCellReuseIdentifier: "ArticleUserNameTableCell")
        viewTable.register(UINib(nibName:"ArticleMediaImgTableCell", bundle: nil), forCellReuseIdentifier: "ArticleMediaImgTableCell")
        viewTable.register(UINib(nibName:"ArticleDescriptionTableCell", bundle: nil), forCellReuseIdentifier: "ArticleDescriptionTableCell")
        viewTable.register(UINib(nibName:"ArticleLikesAndCommentsCountTableCell", bundle: nil), forCellReuseIdentifier: "ArticleLikesAndCommentsCountTableCell")
    }
    private func setTableViewDelegatesAndDataSource(){
        viewTable.separatorStyle = .none
        viewTable.delegate = viewModel
        viewTable.dataSource = viewModel
        viewModel.vc = self
    }
    
     func getArticleList(){
        let request = NSMutableURLRequest(url: NSURL(string: "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=\(currentPageNo)&limit=10")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error ?? "")
          } else {
            if let data1 = data{
             guard let json = try? JSONSerialization.jsonObject(with: data1, options: []) else{return}
                if let jsonArray = json as? [[String:Any]]{
                  //  print("responseData:\(jsonArray)")
                    if jsonArray.count > 0{
                        
                        for item in jsonArray{
                            self.arrArticleList.append(ArticleListModel(fromDictionary: item))
                        }
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.viewTable.reloadData()
            }

          }
        })

        dataTask.resume()
    }

}

