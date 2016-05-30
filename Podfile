platform :ios, '9.0'

use_frameworks!

pod 'RxSwift',    '~> 2.0'
pod 'RxCocoa',    '~> 2.0'

target 'GithubRepositoryBrowser' do
end

target 'GithubRepositoryBrowserCore' do
  target 'GithubRepositoryBrowserCoreTests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 2.0'
    pod 'RxTests',    '~> 2.0'
  end
end

