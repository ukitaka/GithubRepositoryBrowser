//
//  Users.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

import class RxSwift.Observable

protocol Users {
    func findByName(name: String) -> Observable<User>
    func me() -> Observable<User>
}
