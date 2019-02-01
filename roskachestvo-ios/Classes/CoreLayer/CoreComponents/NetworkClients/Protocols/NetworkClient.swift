//
// Created by Юрий Трыков on 2019-02-01.
// Copyright (c) 2019 trykov. All rights reserved.
//

import RxSwift
import Moya

protocol NetworkClient {
    func request(_ token: MultiTarget) -> Observable<Response>
}
