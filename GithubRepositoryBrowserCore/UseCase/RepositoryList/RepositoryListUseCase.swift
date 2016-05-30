//
//  RepositoryListUseCase.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol RepositoryListInputPort {
    var reloadEvent: Observable<Void> { get }
}

public protocol RepositoryListOutputPort {
    var repositoryList: Observable<[Repository]> { get }
}

public struct RepositoryListUseCase: UseCase {
    private let repos = Variable<[Repository]>([])
    private let disposeBag = DisposeBag()
    
    public init(inputPort: RepositoryListInputPort) {
        //TODO: impl
    }
    
}

extension RepositoryListUseCase: RepositoryListOutputPort {
    public var repositoryList: Observable<[Repository]> {
        return repos.asObservable()
    }
}
