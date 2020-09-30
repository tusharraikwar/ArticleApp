//
//  Utils.swift
//  Sharekhan GT
//  Created by Tushar's Macbook Air on 14/05/18.
//  Copyright © 2018 CravXInfotech. All rights reserved.
//


import Foundation
import UIKit
import SVProgressHUD

enum StoryBoardName:String {
    case StoryboardMain = "Main",StoryboardProfile = "Profile",StoryboardDashBoard = "DashBoard"
}

class Utils {
    static let shareInstance = Utils() //added this for singleton instance
    static let defaults = UserDefaults.standard
    static var arrArticleList = [ArticleListModel]()
    
    class func getArticleList(url: String,currentPageNo : String,viewTable: UITableView, params: [String: AnyObject]?, oauth: Bool, result: @escaping (_ jsonArrayCount : Int) -> ()) {
        if Connectivity.isConnectedToInternet{
            showProgressView()
    
               let url = BASE_URL + "v1/blogs?page=\(currentPageNo)&limit=10"
               let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                       cachePolicy: .useProtocolCachePolicy,
                                                   timeoutInterval: 10.0)
               request.httpMethod = "GET"
               let session = URLSession.shared
               let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                dismissProgressView()
                 if (error != nil) {
                   print(error ?? "")
                 } else {
                   if let data1 = data{
                    guard let json = try? JSONSerialization.jsonObject(with: data1, options: []) else{return}
                       if let jsonArray = json as? [[String:Any]]{
                         
                           if jsonArray.count > 0{
                               
                               for item in jsonArray{
                                Utils.arrArticleList.append(ArticleListModel(fromDictionary: item))
                               }
                            result(jsonArray.count)
                           }else{
                            result(jsonArray.count)
                           }
                       }
                   }
                 }
               })
               dataTask.resume()
           
        }else{
            Utils.showAlertViewWithTitleAndMsg(title: "No Internet", message: CHECK_INTERNET_CONNECTION)
        }
     }
    
    class func openCallUrl(strPhone:String){
        if let url = URL(string: "tel://\(strPhone)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }else{
            self.showAlertViewWithTitleAndMsg(title: "Invalid", message: "Something went wrong")
        }
    }
    
    class func getStoryBoardFor(name:StoryBoardName) -> UIStoryboard? { //$_Krishna added this for getting  storyBoard with enum
        let storyboard:UIStoryboard? = UIStoryboard(name: name.rawValue, bundle: nil)
        if let storybd = storyboard{
            print("StoryBoardName",storybd)
        }
        return storyboard
    }
    
    static func showAlertMessagewithOkButton(msg: String, view: UIViewController){
        
        let refreshAlert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        
        view.present(refreshAlert, animated: true, completion: nil)
    }
    
    static func showInfoMessagewithOkButtonWithReturn(msg: String, view: UIViewController, result: @escaping (_: Bool?) -> ()){
        
        let refreshAlert = UIAlertController(title: "Info", message: msg, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            result(true)
        }))
        
        view.present(refreshAlert, animated: true, completion: nil)
        
    }
    
    static func showInfoMessagewithOkCancelButtonWithReturn(msg: String, view: UIViewController, result: @escaping (_: Bool?) -> ()){
        
        let refreshAlert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            result(true)
        }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            result(false)
        }))
        
        view.present(refreshAlert, animated: true, completion: nil)
        
    }
    
    static func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        var arr = array
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)
        
        return arr
    }
 
    @available(iOS 13.0, *)
    static func setRoundAny(Object: Any,radius: CGFloat){
        (Object as AnyObject).layer.borderWidth = 1
        (Object as AnyObject).layer.masksToBounds = true
        (Object as AnyObject).layer.borderColor = UIColor.clear.cgColor
        (Object as AnyObject).layer.cornerRadius = CGFloat(5)
       
    }
    
    static func clearNavigationBar(nav: UINavigationController){
        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.isTranslucent = true
        nav.view.backgroundColor = .clear
        nav.isNavigationBarHidden = false
    }

    static func SetViewCorners(view:UIView,corner1:UIRectCorner,corner2:UIRectCorner,size:CGSize = CGSize(width: 5, height: 5)){
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = view.frame
        rectShape.position = view.center
        rectShape.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [corner1 ,corner2], cornerRadii: size).cgPath
        view.layer.mask = rectShape
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    static func SetViewCornersTextView(view:UITextView,corner1:UIRectCorner,corner2:UIRectCorner,size:CGSize = CGSize(width: 5, height: 5)){
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = view.frame
        rectShape.position = view.center
        rectShape.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [corner1 ,corner2], cornerRadii: size).cgPath
        view.layer.mask = rectShape
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        
    }

    static func SetViewCornersLabel(label:UILabel,corner1:UIRectCorner,corner2:UIRectCorner){
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = label.frame
        rectShape.position = label.center
        rectShape.path = UIBezierPath(roundedRect: label.bounds, byRoundingCorners: [corner1 ,corner2], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        label.layer.mask = rectShape
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.clear.cgColor
        
    }
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
   
    class func isValidPassword(testStr:String) -> Bool {
        let RegEx = "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
        
        let Test = NSPredicate(format:"SELF MATCHES %@",RegEx)
        return Test.evaluate(with: testStr)
    }
    
    static func isEmpty(input : String) -> Bool {
        return input.isEmpty
        
    }

    static func convertToDate(milisecond: Int, dateFormat: String) -> String? {
        let dateVar = Date(timeIntervalSince1970: TimeInterval(milisecond)/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: dateVar)
    }
   
    static func convertToMilliseconds(value: String, dateFormat: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let ObjDate = formatter.date(from: value)
        let since1970 = ObjDate?.timeIntervalSince1970
        return String(Int(since1970 ?? 0) * 1000)
    }

    
    class func getEmptyCell(tableView:UITableView)->UITableViewCell{
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    class func getMainWindow()->UIWindow?{
           if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            return window
        }
        return nil
    }
    class func showAlertMessagewithHandleOkButton(withTitle:String,msg: String, result: @escaping (_: Bool?) -> ()){
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            let refreshAlert = UIAlertController(title: withTitle, message: msg, preferredStyle: UIAlertController.Style.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                result(true)
                print("Handle Ok logic here")
            }))
            
            window.rootViewController?.present(refreshAlert, animated: true, completion: nil)
        }
        result(false)
    }
    class func showAlertViewWithTitleAndMsg(title: String, message: String ) {
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                
            }))
            
            window.rootViewController?.present(refreshAlert, animated: true, completion: nil)
        }
    }
    class func registerUItableViewCell(_ tableView:UITableView){
        tableView.register(UINib(nibName:"ArticleUserNameTableCell", bundle: nil), forCellReuseIdentifier: "ArticleUserNameTableCell")
        tableView.register(UINib(nibName:"ArticleMediaImgTableCell", bundle: nil), forCellReuseIdentifier: "ArticleMediaImgTableCell")
        tableView.register(UINib(nibName:"ArticleDescriptionTableCell", bundle: nil), forCellReuseIdentifier: "ArticleDescriptionTableCell")
        tableView.register(UINib(nibName:"ArticleLikesAndCommentsCountTableCell", bundle: nil), forCellReuseIdentifier: "ArticleLikesAndCommentsCountTableCell")
    }
       
}

func showProgressView(){
    DispatchQueue.main.async {
        SVProgressHUD.setHapticsEnabled(true)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setBackgroundColor(.lightGray)
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.show(withStatus: "Loading...")
        // SVProgressHUD.init(frame: CGRect(x: UIScreen.main.bounds.size.width*0.5, y: UIScreen.main.bounds.size.height*0.5, width: 100, height: 100))
       // SVProgressHUD.sho
    }
}
func dismissProgressView(){
    DispatchQueue.main.async {
        SVProgressHUD.dismiss()
    }
}
