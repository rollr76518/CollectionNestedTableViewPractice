//
//  CollectionViewNestedTableViewCell.swift
//  CollectionNestedTableViewPractice
//
//  Created by Hanyu on 2018/4/19.
//  Copyright © 2018年 Hanyu. All rights reserved.
//

import UIKit

class CollectionViewNestedTableViewCell: UITableViewCell {

	@IBOutlet weak var collectionView: UICollectionView!
	
	var images: [UIImage] = [] {
		didSet {
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
	}
	
	let cellNibName = "ImageCollectionViewCell"
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		collectionView.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: cellNibName)
		collectionView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
		collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
		collectionView.layoutIfNeeded()
		return collectionView.collectionViewLayout.collectionViewContentSize
	}
}

extension CollectionViewNestedTableViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return images.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellNibName, for: indexPath) as! ImageCollectionViewCell
		
		cell.imageView.image = images[indexPath.row]
		
		return cell
	}
}

extension CollectionViewNestedTableViewCell: UICollectionViewDelegate {
	
}

extension CollectionViewNestedTableViewCell: UICollectionViewDelegateFlowLayout {

}
