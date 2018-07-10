//
//  ViewController.swift
//  SmartDubai
//
//  Created by Muhammad Umar on 09/07/2018.
//  Copyright © 2018 Muhammad Umar. All rights reserved.
//

import UIKit
import TrafficBase
class ListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView?
    var manager = apiManager()
    var userData = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //for Cell to autogrow
        tableView?.estimatedRowHeight = 120
        tableView?.rowHeight = UITableViewAutomaticDimension
        self.navigationController?.isNavigationBarHidden = true
        getData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
//MARK:- Functions
extension ListViewController{
    func getData(){
        let requestParam = self.manager.params()
        self.manager.api(requestParam, completion: {
            if self.manager.isSuccess {
                self.userData = self.manager.resultData!
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            }
            else {
                Alert.showMsg(msg: self.manager.modelData?.status ?? NSLocalizedString("There is some problem occur.", comment: ""))
                //                        Alert.showMsg(msg: self.manager.)
            }
        })
    }
}
//MARK:- Table View Delegates
extension ListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        cell.configCell(userData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.dataMedia = self.userData[indexPath.row].media
        navigationController?.pushViewController(vc,
                                                 animated: true)
        
    }
}
