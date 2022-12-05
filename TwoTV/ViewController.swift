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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.firstTV.setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)
            self.firstTV.setContentOffset(.zero, animated: true)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.firstTV.setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)
            self.firstTV.setContentOffset(.zero, animated: true)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.firstTV.setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)
            self.firstTV.setContentOffset(.zero, animated: true)
        })
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
//            self.firstTV.setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)
//            self.firstTV.setContentOffset(.zero, animated: true)
//        })
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
//            self.firstTV.setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)
//            self.firstTV.setContentOffset(.zero, animated: true)
//        })
//        DispatchQueue.main.asyncAfter(deadline: .now() + 7, execute: {
//            self.firstTV.setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)
//            self.firstTV.setContentOffset(.zero, animated: true)
//        })
        
        // Do any additional setup after loading the view.
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        DispatchQueue.main.async {
//
//        }
//    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.firstTV.beginUpdates()
//        self.firstTV.setNeedsDisplay()
//        self.firstTV.endUpdates()
//    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for:  indexPath) as! FirstTableViewCell
        cell.firstLbl.text = "\(indexPath.row)"
//        UIView.performWithoutAnimation { [weak self] in
//            self?.firstTV.reloadRows(at: [indexPath], with: .none)
//        }
        return cell
    }
    
    
}

