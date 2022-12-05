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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        secondTV.isScrollEnabled = false
  
        secondTV.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
        
        secondTV.rowHeight = UITableView.automaticDimension
        secondTV.estimatedRowHeight = 12
        
//        DispatchQueue.main.async {
//            
//            self.secondTV.reloadData()
//            
//            self.secondTV.setNeedsLayout()
//            self.secondTV.layoutIfNeeded()
//            
//            self.secondTV.reloadData()
//            
//        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.secondTV.beginUpdates()
            self.heightSecondTV.constant = self.secondTV.contentSize.height
            self.secondTV.setNeedsDisplay()
            self.secondTV.endUpdates()
            
        }
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
//            print("after 2 seconds in FTVC")
//            self.secondTV.beginUpdates()
//            self.heightSecondTV.constant = self.secondTV.contentSize.height
//            self.secondTV.setNeedsDisplay()
//            self.secondTV.endUpdates()
//
//        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension FirstTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for:  indexPath) as! SecondTableViewCell
        cell.innerLbl.text = "\(indexPath.row)"
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        return cell
    }
    
    
}
