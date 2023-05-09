//
//  Score.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

struct Score: Codable {
    let penalty, fulltime, extratime, halftime: Goals?
}
