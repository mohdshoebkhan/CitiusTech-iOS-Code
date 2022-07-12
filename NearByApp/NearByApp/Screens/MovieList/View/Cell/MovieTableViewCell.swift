//
//  MovieTableViewCell.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
   

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    // MARK: - Default initilize
    func initView() {
        // Cell view customization
        backgroundColor = .clear

        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    var cellViewModel: Movie? {
        didSet {
            titleLabel.text = "\(cellViewModel?.name ?? "")"
            subTitleLabel.text = "\(cellViewModel?.desc ?? "")"
            movieImageView.kf.setImage(with: URL(string: cellViewModel?.imageUrl ?? ""))
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
