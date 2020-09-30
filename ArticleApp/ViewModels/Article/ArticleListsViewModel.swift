//
//  ArticleListsViewModel.swift
//  ArticalDetailApp
//
 
//


import Foundation
import UIKit

class ArticleListsViewModel: NSObject {
    lazy var vc:ArticleListVC? = {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ArticleListVC") as? ArticleListVC{
            return vc
        }
        return nil
    }()
    
    // var arr = [CategoryModel]()
    var arrHeights = [[100,150,UITableView.automaticDimension,50],[100,UITableView.automaticDimension,50]]
    override init() {
        super.init()
    }

}
extension ArticleListsViewModel : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let vc = self.vc{
            return vc.arrArticleList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let vc = self.vc{
            return vc.arrArticleList[section].media.count > 0 ? 4 : 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let vc = self.vc{
            
            if indexPath.row == vc.arrArticleList.count - 1 {
                vc.currentPageNo = vc.currentPageNo + 1
                vc.getArticleList()
            }
            let model = vc.arrArticleList[indexPath.section]
            if indexPath.row == 0{
               let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleUserNameTableCell", for: indexPath) as! ArticleUserNameTableCell
                cell.imgUser.backgroundColor = .lightGray
                cell.lblUserName.text = model.user[0].name + model.user[0].lastname
                cell.lblUserDesignation.text = model.user[0].designation
                return cell
            }else {
                if vc.arrArticleList[indexPath.section].media.count > 0{
                    if indexPath.row == 1{
                       let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleMediaImgTableCell", for: indexPath) as! ArticleMediaImgTableCell
                        cell.imgArticle.backgroundColor = .lightGray
                        return cell
                    }else if indexPath.row == 2{
                      let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleDescriptionTableCell", for: indexPath) as! ArticleDescriptionTableCell
                        return cell
                    }else{
                        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleLikesAndCommentsCountTableCell", for: indexPath) as! ArticleLikesAndCommentsCountTableCell
                        return cell
                    }
                }else{
                    if indexPath.row == 1{
                       let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleDescriptionTableCell", for: indexPath) as! ArticleDescriptionTableCell
                        return cell
                    }else{
                        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleLikesAndCommentsCountTableCell", for: indexPath) as! ArticleLikesAndCommentsCountTableCell
                        return cell
                    }
                }
                
            }
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let vc = self.vc{
            return vc.arrArticleList[indexPath.section].media.count > 0 ? arrHeights[0][indexPath.row] : arrHeights[1][indexPath.row]
        }
        return 0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
}
