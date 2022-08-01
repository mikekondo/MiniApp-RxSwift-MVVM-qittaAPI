//
//  QittaArticleViewModel.swift
//  RxSwift-MVVM-qittaAPI
//
//  Created by 近藤米功 on 2022/08/01.
//

import Foundation
import RxCocoa
import RxSwift

class QittaArticleViewModel{
    private var disposeBag = DisposeBag()

    var articles = BehaviorRelay<[QittaArticle]>(value: [])

    func requestQittaArticle(){
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=20") else { return }
        // URLRequest型にキャスト
        let urlRequest = URLRequest(url: url)

        URLSession.shared.rx.response(request: urlRequest).subscribe { [weak self] response, data in
            guard let articles = try? JSONDecoder().decode([QittaArticle].self, from: data) else {
               print("dataを取得できませんでした")
               return
            }
            // イベント発生的な？
            self?.articles.accept(articles)
        } onError: { error in
            print(error.localizedDescription)
        }
        .disposed(by: disposeBag)



    }

}
