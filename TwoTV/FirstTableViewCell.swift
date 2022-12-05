//
//  FirstTableViewCell.swift
//  TwoTV
//
//  Created by Thaw De Zin on 12/4/22.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var secondTV: UITableView!
    @IBOutlet weak var heightSecondTV: NSLayoutConstraint!
    @IBOutlet weak var firstLbl: UILabel!
    
    var count : Int = 12
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        secondTV.isScrollEnabled = false
  
        secondTV.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
        
        secondTV.rowHeight = UITableView.automaticDimension

    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        if self.count == 12 {
            self.count = 5
            print("set to 5")
            
            DispatchQueue.main.async {
                self.secondTV.reloadData()
                self.secondTV.setNeedsLayout()
                self.secondTV.layoutIfNeeded()
                self.secondTV.reloadData()
            }
            NotificationCenter.default.post(name: Notification.Name(rawValue: "ut"), object: nil)
            
        } else {
            self.count = 12
            print("set to 12")
            DispatchQueue.main.async {
                self.secondTV.reloadData()
                self.secondTV.setNeedsLayout()
                self.secondTV.layoutIfNeeded()
                self.secondTV.reloadData()
            }
            NotificationCenter.default.post(name: Notification.Name(rawValue: "ut"), object: nil)
            
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews in Cell")
        DispatchQueue.main.async {
            
//            self.secondTV.beginUpdates()
            self.heightSecondTV.constant = self.secondTV.contentSize.height
//            self.secondTV.setNeedsDisplay()
//            self.secondTV.endUpdates()
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension FirstTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for:  indexPath) as! SecondTableViewCell
        cell.innerLbl.text = "\(indexPath.row)"
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ut"), object: nil)
        return cell
    }
    
   
    
    
}
