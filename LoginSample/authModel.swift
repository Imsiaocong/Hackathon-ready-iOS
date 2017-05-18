//
//  authModel.swift
//  LoginSample
//
//  Created by Di Wang on 2017/5/14.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import Foundation

protocol AuthDelegate {
    func auth(_ username: String, password: String)
}
