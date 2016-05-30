//
//  DI.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

@_exported import class Swinject.Container

public struct DIContainer {
    public static let container = Container()
    
    private init() { }
    
    public static func regist(@noescape block: Container -> Void) {
        container.removeAll()
        block(container)
    }
}

protocol UsesCoreComponents {
    var repositories: Repositories { get }
    var users: Users { get }
}

extension UsesCoreComponents {
    var repository: Repositories {
        guard let r = DIContainer.container.resolve(Repositories.self) else {
            preconditionFailure("Repositories is not registered")
        }
        return r
    }
    
    var users: Users {
        guard let u = DIContainer.container.resolve(Users.self) else {
            preconditionFailure("Users is not registered")
        }
        return u
    }
}
