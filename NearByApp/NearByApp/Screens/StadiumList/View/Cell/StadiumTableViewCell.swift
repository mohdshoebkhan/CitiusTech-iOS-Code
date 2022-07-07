//
//  StadiumTableViewCell.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.
//

import UIKit

class StadiumTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var arrowImageView: UIImageView!
    @IBOutlet var sepratorView: UIView!

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    // MARK: - Default initilize
    func initView() {
        backgroundColor = .clear
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    // MARK: - Property Observer
    var cellViewModel: Stadium? {
        didSet {
            titleLabel.text = "Stadium name:- \(cellViewModel?.name ?? "")"
            subTitleLabel.text = "\(cellViewModel?.desc ?? "")"
        }
    }
}
