//
//  DetailViewController.swift
//  SmartDubai
//
//  Created by Muhammad Umar on 10/07/2018.
//  Copyright © 2018 Muhammad Umar. All rights reserved.
//

import UIKit
import TrafficBase
class DetailViewController: UIViewController {

    @IBOutlet weak var lblCaption: UILabel?
    @IBOutlet weak var tableView: UITableView?
    var dataMedia = [Media]()
    var dataArr = [MediaMetadatum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK:- Functions
extension DetailViewController{
    func getData(){
        self.navigationController?.isNavigationBarHidden = false
        lblCaption?.text = dataMedia[0].caption
        dataArr = dataMedia[0].mediaMetadata
        tableView?.estimatedRowHeight = 120
        tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.reloadData()
    }
}

//MARK:- Table View Delegates
extension DetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        
        cell.configCell(dataArr[indexPath.row])
        return cell
    }
    

}
