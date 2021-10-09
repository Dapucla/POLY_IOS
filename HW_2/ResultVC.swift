//
//  ResultVC.swift
//  HW_2
//
//  Created by Даниил Алексеев on 06.10.2021.
//

import UIKit

class ResultVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    var authorLabelText: String?
    var dummyData = ["data 0","data 1","data 2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        authorNameLabel?.text = authorLabelText
        tableView.delegate = self
        tableView.dataSource = self
        
        NetworkManager.shared.getAuthor(for: authorLabelText ?? "") { (authors, errorMessage) in
            guard authors != nil else {
                print("нет ответа")
                return
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.authorsResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultsTVC
        
        cell.resultLabel.text = NetworkManager.authorsResults[indexPath.row].artistName
        cell.backgroundColor = UIColor.clear

    
        
        if let imageURL = URL(string:  NetworkManager.authorsResults[indexPath.row].artworkUrl100 ?? "") {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.resultImage.image = image
                    }
                }
            }
        }
        return cell
    }
    
    
    
}
