//
//  QittaArticleTableViewCell.swift
//  RxSwift-MVVM-qittaAPI
//
//  Created by 近藤米功 on 2022/08/01.
//

import UIKit

class QittaArticleTableViewCell: UITableViewCell {

    static var identifier = "QittaArticleCell"

    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(qittaArticle: QittaArticle, row: Int){
        userNameLabel.text = "ユーザ名:" + qittaArticle.user.id
        titleLabel.text = "タイトル:" + qittaArticle.title
        // self.contentView.backgroundColor = (row % 2 == 0) ? .black : .gray
    }
    
}
