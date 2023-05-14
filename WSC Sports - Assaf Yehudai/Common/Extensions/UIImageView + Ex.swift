//
//  UIImageView + Ex.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import UIKit

extension UIImageView {
    
    private var imageRepo: ImagesCache {
        return .shared
    }
    
    func load(stringUrl: String?, fallback: UIImage?) {
        guard
            stringUrl != nil,
            let url = URL(string: stringUrl!)
        else { image = fallback; return }
        Task {
            image = await imageRepo.loadImage(url: url) ?? fallback
        }
    }
}
