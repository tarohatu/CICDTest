//
//  Rx+Session.swift
//  SampleProject
//
//  Created by Takuya Jimbo on 2021/03/24.
//  Copyright © 2021 Takuya Jimbo. All rights reserved.
//

import APIKit
import RxSwift
import RxCocoa
import SwinjectStoryboard

extension Session: ReactiveCompatible {}

extension Reactive where Base: Session {
    
    func response<T: Request>(from request: T) -> Observable<T.Response> {
        return Observable<T.Response>.create { observer in
            let task = self.base.send(request) { result in
                switch result {
                case .success(let response):
                    observer.onNext(response)
                    observer.onCompleted()
                case .failure(.connectionError(let error)):
                    observer.onError(error)
                case .failure(.responseError(let error as APIResponseError)):
                    observer.onError(error)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                task?.cancel()
            }
        }.catchError { error in
            guard let apiResponseError = error as? APIResponseError else {
                return Observable.error(error)
            }
            switch apiResponseError {
            default:
                return Observable.error(error)
            }
        }
    }
    
}
