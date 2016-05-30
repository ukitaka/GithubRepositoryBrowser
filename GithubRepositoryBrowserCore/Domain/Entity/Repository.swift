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
