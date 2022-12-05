//
//  ViewController.swift
//  TwoTV
//
//  Created by Thaw De Zin on 12/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTV.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
        
    }
    
    

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for:  indexPath) as! FirstTableViewCell
        cell.firstLbl.text = "\(indexPath.row)"
        return cell
    }
    
    
}

