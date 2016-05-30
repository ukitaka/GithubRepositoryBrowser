//
//  RepositoryListUseCase.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

import RxSwift
import RxCocoa

public struct ReloadRepositoryListEvent {
    let ownerName: String?
}

public protocol RepositoryListInputPort {
    var reloadEvent: Observable<ReloadRepositoryListEvent> { get }
}

public protocol RepositoryListOutputPort {
    var repositoryList: Observable<[Repository]> { get }
}

public class RepositoryListUseCase: UseCase {
    private let repos = BehaviorSubject<[Repository]>(value: [])
    private let disposeBag = DisposeBag()
    
    public init(inputPort: RepositoryListInputPort) {
        inputPort.reloadEvent
            .flatMap(findRepositories)
            .bindTo(repos)
            .addDisposableTo(disposeBag)
    }
    
    private func findRepositories(e: ReloadRepositoryListEvent) -> Observable<[Repository]> {
        if let name = e.ownerName {
            return repositories.findByOwner(name)
        } else {
           return users.me().flatMap { [unowned self] u in
                return self.repositories.findByOwner(u.login)
            }
        }
    }
}

extension RepositoryListUseCase: RepositoryListOutputPort {
    public var repositoryList: Observable<[Repository]> {
        return repos.asObservable()
    }
}
