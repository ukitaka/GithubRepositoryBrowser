//
//  Repositories.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

import class RxSwift.Observable

protocol Repositories {
    func findByOwner(owner: String) -> Observable<[Repository]>
    func findByOwner(owner: String, repository: String) -> Observable<Repository>
}
