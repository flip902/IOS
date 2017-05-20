//
//  ViewController.swift
//  codeOnly
//
//  Created by Flip Carlino on 2017-04-23.
//  Copyright © 2017 Flip Carlino. All rights reserved.
//

import UIKit

class CustomCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let CustomCellIdentifier = "custumCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: CustomCellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellIdentifier, for: indexPath) as! CustomCell
        customCell.nameLabel.text = names[indexPath.item]
        return customCell
    }
    
    let names = ["Billy Savary", "Sarah Fong", "Jada Wornell"]

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    class CustomCell: UICollectionViewCell {
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Billy's cellViews"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        func setupViews() {
            
            backgroundColor = UIColor.darkGray
            addSubview(nameLabel)
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        
        
    }

}

