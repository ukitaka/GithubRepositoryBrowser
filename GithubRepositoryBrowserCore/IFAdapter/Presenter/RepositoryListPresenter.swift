//
//  RepositoryListPresenter.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/31.
//  Copyright © 2016年 waft. All rights reserved.
//

import RxSwift
import RxCocoa

public struct RepositoryListPresenter {
    private let disposeBag = DisposeBag()
    private let useCase: RepositoryListUseCase
    
    // MARK: - View models
    public let repositoryList = Variable<[Repository]>([])
    public let isLoading = Variable<Bool>(false)
    
    // MARK: - initializer
    public init(inputPort: RepositoryListInputPort) {
        useCase = RepositoryListUseCase(inputPort: inputPort)
        useCase.repositoryList
            .bindTo(repositoryList)
            .addDisposableTo(disposeBag)
    }
}
