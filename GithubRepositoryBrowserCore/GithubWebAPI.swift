//
//  GithubWebAPI.swift
//  GithubRepositoryBrowser
//
//  Created by Yuki Takahashi on 2016/05/30.
//  Copyright © 2016年 waft. All rights reserved.
//

import Octokit
import RxSwift
import RxCocoa
import RequestKit

public class GithubWebAPI {
    private let octoKit = Octokit(GithubTokenConfig)
}

extension GithubWebAPI {
    private func completion<R, T>(obs: AnyObserver<T>, _ f: R -> T?) -> (response: Response<R>) -> Void {
        return { res in
            switch res {
            case .Success(let r):
                if let t = f(r) {
                    obs.onNext(t)
                }
                obs.onCompleted()
            case .Failure(let error):
                obs.onError(error)
            }
        }
    }
}

extension GithubWebAPI: Users {
    func findByName(name: String) -> Observable<User> {
        return Observable.create { [unowned self] observer in
            self.octoKit.user(name, completion: self.completion(observer, User.init))
            return AnonymousDisposable { }
        }
    }
    
    func me() -> Observable<User> {
        return Observable.create { [unowned self] observer in
            self.octoKit.me(self.completion(observer, User.init))
            return AnonymousDisposable { }
        }
    }
}

extension GithubWebAPI: Repositories {
    func findByOwner(owner: String) -> Observable<[Repository]> {
        return Observable.create { [unowned self] observer in
            self.octoKit.repositories(owner,
                page: "1",
                perPage: "100",
                completion: self.completion(observer, { $0.flatMap(Repository.init) }))
            return AnonymousDisposable { }
        }
    }
    
    func findByOwner(owner: String, repository: String) -> Observable<Repository> {
        return Observable.create { [unowned self] observer in
            self.octoKit.repository(owner, name: repository, completion: self.completion(observer, Repository.init))
            return AnonymousDisposable { }
        }
    }
}
