//
//  ViewController.swift
//  CollectionNestedTableViewPractice
//
//  Created by Hanyu on 2018/4/19.
//  Copyright © 2018年 Hanyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	let cellNibName = "CollectionViewNestedTableViewCell"
	
	let images01 = [#imageLiteral(resourceName: "Lion"), #imageLiteral(resourceName: "Lion"), #imageLiteral(resourceName: "Lion")]
	let images02 = [#imageLiteral(resourceName: "Elephant"), #imageLiteral(resourceName: "Elephant"), #imageLiteral(resourceName: "Elephant"), #imageLiteral(resourceName: "Elephant"), #imageLiteral(resourceName: "Elephant"), #imageLiteral(resourceName: "Elephant"), #imageLiteral(resourceName: "Elephant"), #imageLiteral(resourceName: "Elephant")]
	
	var data: [[UIImage]] {
		return [images01, images02]
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellNibName)
		
	}
	
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellNibName, for: indexPath) as! CollectionViewNestedTableViewCell
		
		cell.images = data[indexPath.row]
		
		return cell
	}
}

extension ViewController: UITableViewDelegate {

}
