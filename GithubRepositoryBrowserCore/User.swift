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

extension User {
    init?(_ response: Octokit.User) {
        guard let login = response.login,
            let avatarURL = response.avatarURL.flatMap(NSURL.init),
            let name = response.name,
            let numberOfPrivateRepos = response.numberOfPrivateRepos,
            let numberOfPublicRepos = response.numberOfPublicRepos else {
                return nil
        }
        self.id = response.id
        self.login = login
        self.avatarURL = avatarURL
        self.name = name
        self.numberOfPublicRepos = numberOfPublicRepos
        self.numberOfPrivateRepos = numberOfPrivateRepos
    }
}
