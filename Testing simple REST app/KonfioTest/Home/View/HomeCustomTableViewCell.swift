//
//  HomeCustomTableViewCell.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 11/11/21.
//

import UIKit
import Kingfisher

class HomeCustomTableViewCell: UITableViewCell {
    
    let padding : CGFloat = 10
    static let id = "HomeCustomTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    var customView: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 10
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    let viewContainer : UIView = {
        let view = UIView(frame: .zero)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let iconView : UIImageView = {
        let imageview = UIImageView(frame: .zero)
        imageview.contentMode = .scaleToFill
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 10
        imageview.backgroundColor = .clear
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let titlelabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = ColorsHelper.black
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionlabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = ColorsHelper.gray
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categorylabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = ColorsHelper.black
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pricelabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = ColorsHelper.black
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        iconView.kf.cancelDownloadTask() // first, cancel currenct download task
        iconView.kf.setImage(with: URL(string: "")) // second, prevent kingfisher from setting previous image
        iconView.image = nil
    }
    
}

//MARK: - Setup Views
extension HomeCustomTableViewCell{
    func setupViews(){
        
        self.contentView.addSubview(customView)
        customView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        customView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 15).isActive = true
        
        customView.addSubview(iconView)
        iconView.topAnchor.constraint(equalTo: customView.topAnchor, constant: padding).isActive = true
        iconView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: padding*2).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        customView.addSubview(viewContainer)
        viewContainer.topAnchor.constraint(equalTo: customView.topAnchor, constant: padding).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: iconView.trailingAnchor).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -padding*2).isActive = true
        viewContainer.heightAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        viewContainer.bottomAnchor.constraint(lessThanOrEqualTo: customView.bottomAnchor).isActive = true
        
        viewContainer.addSubview(titlelabel)
        titlelabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: padding).isActive = true
        titlelabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        titlelabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(descriptionlabel)
        descriptionlabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: padding).isActive = true
        descriptionlabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        descriptionlabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(categorylabel)
        categorylabel.topAnchor.constraint(equalTo: descriptionlabel.bottomAnchor, constant: padding).isActive = true
        categorylabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        categorylabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(pricelabel)
        pricelabel.topAnchor.constraint(equalTo: categorylabel.bottomAnchor, constant: padding).isActive = true
        pricelabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        pricelabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.bottomAnchor.constraint(equalTo: pricelabel.bottomAnchor, constant: padding*2).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
        customView.setNeedsLayout()
        customView.layoutIfNeeded()
        customView.addShadow()
    } 
}

//MARK: - Methods for data
extension HomeCustomTableViewCell{
    func setData(title: String, description: String, category: String, price: String, image: String){
        self.titlelabel.text = title
        self.descriptionlabel.text = description
        self.categorylabel.text = category
        self.pricelabel.text = price
        self.iconView.kf.setImage(with: URL(string: image))
    }
}
