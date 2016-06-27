//
//  RepositoryDetailUseCase.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

import RxSwift
import RxCocoa

public struct ReloadRepositoryDetailEvent {
    let ownerName: String
    let repositoryName: String
}

public protocol RepositoryDetailOutputPort {
    var reloadEvent: Observable<ReloadRepositoryDetailEvent> { get }
}

public protocol RepositoryDetailInputPort {
    var repository: Observable<Repository> { get }
}

public class RepositoryDetailUseCase: UseCase {
    private let repo = PublishSubject<Repository>()
    private let disposeBag = DisposeBag()
    
    public init(outputPort: RepositoryDetailOutputPort) {
        outputPort.reloadEvent
            .flatMap { [unowned self] e in
                self.repositories.findByOwner(e.ownerName, repository: e.repositoryName)
            }
            .bindTo(repo)
            .addDisposableTo(disposeBag)
    }
}

extension RepositoryDetailUseCase: RepositoryDetailInputPort {
    public var repository: Observable<Repository> {
        return repo.asObservable()
    }
}
