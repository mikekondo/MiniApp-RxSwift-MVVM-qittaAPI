//
//  ViewController.swift
//  RxSwift-MVVM-qittaAPI
//
//  Created by 近藤米功 on 2022/08/01.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private var qittaArticleViewModel = QittaArticleViewModel()
    private var disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        qittaArticleViewModel.requestQittaArticle()
    }

    private func setupBindings(){
        qittaArticleViewModel.articles.bind(to: tableView.rx.items(cellIdentifier: QittaArticleTableViewCell.identifier, cellType: QittaArticleTableViewCell.self)) { row, element, cell in
            cell.configureCell(qittaArticle: element, row: row)
        }
        .disposed(by: disposeBag)

    }

    private func setupTableView(){
        tableView.rowHeight = 100
        tableView.register(UINib(nibName: "QittaArticleTableViewCell", bundle: nil), forCellReuseIdentifier: QittaArticleTableViewCell.identifier)

    }


}

