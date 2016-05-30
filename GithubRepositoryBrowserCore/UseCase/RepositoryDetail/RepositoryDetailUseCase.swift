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

public protocol RepositoryDetailInputPort {
    var reloadEvent: Observable<ReloadRepositoryDetailEvent> { get }
}

public protocol RepositoryDetailOutputPort {
    var repository: Observable<Repository> { get }
}

public class RepositoryDetailUseCase: UseCase {
    private let repo = PublishSubject<Repository>()
    private let disposeBag = DisposeBag()
    
    public init(inputPort: RepositoryDetailInputPort) {
        inputPort.reloadEvent
            .flatMap { [unowned self] e in
                self.repositories.findByOwner(e.ownerName, repository: e.repositoryName)
            }
            .bindTo(repo)
            .addDisposableTo(disposeBag)
    }
}

extension RepositoryDetailUseCase: RepositoryDetailOutputPort {
    public var repository: Observable<Repository> {
        return repo.asObservable()
    }
}
