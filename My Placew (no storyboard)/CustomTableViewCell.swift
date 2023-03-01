//
//  CustomTableViewCell.swift
//  My Placew (no storyboard)
//
//  Created by Максим on 14.11.2022.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var locationLabel = UILabel()
    var typeLabel = UILabel()
    let imageOfPlace = UIImageView()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        imageOfPlace.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        imageOfPlace.layer.cornerRadius = imageOfPlace.frame.size.height / 2
        imageOfPlace.clipsToBounds = true
        imageOfPlace.contentMode = .scaleAspectFill
        contentView.addSubview(imageOfPlace)
        
        nameLabel.frame = CGRect(x: 100, y: 13, width: 160, height: 25)
        nameLabel.font = UIFont(name: "AlNile-Bold", size: 22)
        contentView.addSubview(nameLabel)
        
        locationLabel.frame = CGRect(x: 100, y: 43, width: 160, height: 19)
        locationLabel.font = UIFont(name: "Al Nile", size: 17)
        contentView.addSubview(locationLabel)
        
        typeLabel.frame = CGRect(x: 100, y: 68, width: 160, height: 19)
        typeLabel.font = UIFont(name: "Al Nile", size: 17)
        contentView.addSubview(typeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    //nameLabel.translatesAutoresizingMaskIntoConstraints = false
    //nameLabel.font = UIFont.systemFont(ofSize: 20)
    

        
}

