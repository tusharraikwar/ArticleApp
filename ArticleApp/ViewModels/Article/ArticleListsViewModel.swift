//
//  ArticleListsViewModel.swift
//  ArticalDetailApp
//
 
//


import Foundation
import UIKit
import SDWebImage
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
        return Utils.arrArticleList.count

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Utils.arrArticleList[section].media.count > 0 ? 4 : 3
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.isLast(for: indexPath) {
           print("Last Row - Do Specific action")
            if let VC = self.vc{
                VC.currentPageNo = VC.currentPageNo + 1
                VC.CallForArticleListing()
            }
        }
        
        let model = Utils.arrArticleList[indexPath.section]
        if indexPath.row == 0{
           let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleUserNameTableCell", for: indexPath) as! ArticleUserNameTableCell

            cell.lblUserName.text = model.user[0].name + model.user[0].lastname
            cell.lblUserDesignation.text = model.user[0].designation
            
            cell.imgUser.backgroundColor = .lightGray
            if let imageUrl = model.user[0].avatar{
            cell.imgUser.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder.png"))
            }
            
            return cell
        }else if Utils.arrArticleList[indexPath.section].media.count > 0{
                if indexPath.row == 1{
                   let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleMediaImgTableCell", for: indexPath) as! ArticleMediaImgTableCell
                    cell.imgArticle.backgroundColor = .lightGray
                    cell.imgArticle.contentMode = .scaleAspectFit
                    if let imageUrl = model.media[0].image{
                    cell.imgArticle.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder.png"))
                    }
                    return cell
                }else if indexPath.row == 2{
                  let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleDescriptionTableCell", for: indexPath) as! ArticleDescriptionTableCell
                    cell.txtViewDescription.text = model.content
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleLikesAndCommentsCountTableCell", for: indexPath) as! ArticleLikesAndCommentsCountTableCell
                    cell.lblLikes.text =  "\(model.likes ?? 0) Likes"
                    cell.lblComments.text = "\(model.comments ?? 0) Comments"
                    return cell
                }
            }
            else if indexPath.row == 2{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleLikesAndCommentsCountTableCell", for: indexPath) as! ArticleLikesAndCommentsCountTableCell
                    cell.lblLikes.text =  "\(model.likes ?? 0) Likes"
                    cell.lblComments.text = "\(model.comments ?? 0) Comments"
                    return cell
            }else{
                if indexPath.row == 1{
                   let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleDescriptionTableCell", for: indexPath) as! ArticleDescriptionTableCell
                    
                    return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Utils.arrArticleList[indexPath.section].media.count > 0 ? arrHeights[0][indexPath.row] : arrHeights[1][indexPath.row]
        
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

extension UITableView {

    func isLast(for indexPath: IndexPath) -> Bool {

        let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
        let indexOfLastRowInLastSection = numberOfRows(inSection: indexOfLastSection) - 1

        return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
    }
}
