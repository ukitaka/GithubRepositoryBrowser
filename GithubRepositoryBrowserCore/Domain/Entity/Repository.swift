//
//  Repository.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

import class Octokit.Repository

public struct Repository {
    public let id: Int
    public let owner: User
    public let name: String
    public let fullName: String
    public let isPrivate: Bool
    public let repositoryDescription: String
    public let isFork: Bool
    public let gitURL: NSURL
    public let sshURL: NSURL
    public let cloneURL: NSURL
    public let htmlURL: NSURL
    public let size: Int
    public let lastPush: NSDate
}

extension Repository {
    init?(_ response: Octokit.Repository) {
        guard let owner = User(response.owner),
            let name = response.name,
            let fullName = response.fullName,
            let repositoryDescription = response.repositoryDescription,
            let isFork = response.isFork,
            let gitURL = response.gitURL.flatMap(NSURL.init),
            let sshURL = response.sshURL.flatMap(NSURL.init),
            let cloneURL = response.cloneURL.flatMap(NSURL.init),
            let htmlURL = response.htmlURL.flatMap(NSURL.init),
            let lastPush = response.lastPush else {
                return nil
        }
        
        self.id = response.id
        self.owner = owner
        self.name = name
        self.fullName = fullName
        self.isPrivate = response.isPrivate
        self.repositoryDescription = repositoryDescription
        self.isFork = isFork
        self.gitURL = gitURL
        self.sshURL = sshURL
        self.cloneURL = cloneURL
        self.htmlURL = htmlURL
        self.size = response.size
        self.lastPush = lastPush
    }
}