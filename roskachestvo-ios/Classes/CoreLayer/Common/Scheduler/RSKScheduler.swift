//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import RxSwift

struct RSKScheduler {
    public static let background = ConcurrentDispatchQueueScheduler.init(qos: .background)
}
