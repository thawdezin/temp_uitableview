//
//  ViewController.swift
//  TwoTV
//
//  Created by Thaw De Zin on 12/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTV: UITableView!
    @IBOutlet weak var heightFirstTV: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTV.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
        firstTV.rowHeight = UITableView.automaticDimension

        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.firstTV.reloadData()
            
            self.firstTV.setNeedsLayout()
            self.firstTV.layoutIfNeeded()
            
            self.firstTV.reloadData()
            
        })
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            print("after 2 seconds in ViewController")
            self.firstTV.beginUpdates()
            self.heightFirstTV.constant = self.firstTV.contentSize.height
            self.firstTV.setNeedsDisplay()
            self.firstTV.endUpdates()
            
        })
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for:  indexPath) as! FirstTableViewCell
        cell.firstLbl.text = "\(indexPath.row)"
        cell.setNeedsLayout()
        cell.layoutIfNeeded() 
        return cell
    }
    
    
}

