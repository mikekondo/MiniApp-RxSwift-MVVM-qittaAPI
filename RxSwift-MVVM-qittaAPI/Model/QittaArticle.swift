//
//  QittaArticle.swift
//  RxSwift-MVVM-qittaAPI
//
//  Created by 近藤米功 on 2022/08/01.
//

import Foundation

// MARK: - QittaArticle
struct QittaArticle: Codable{
    let title: String
    let url: String
    let user: User
}

// MARK: - User
struct User: Codable{
    let id: String
    let profileImageURL: String

    enum CodingKeys: String, CodingKey{
        case id
        case profileImageURL = "profile_image_url"
    }
}

