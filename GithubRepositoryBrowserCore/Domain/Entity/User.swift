//
//  User.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

import class Octokit.User

public struct User {
    public let id: Int
    public let login: String
    public let avatarURL: NSURL
    public let name: String
    public let numberOfPublicRepos: Int
    public let numberOfPrivateRepos: Int
}
