//
//  AsyncRenderer.swift
//  AsyncDrawing
//
//  Created by Arabia -IT on 7/2/19.
//  Copyright © 2019 Arabia-IT. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class AsyncRenderer {
    private let queue: DispatchQueue
    private let text: NSAttributedString
    
    init(queue: DispatchQueue, text: NSAttributedString) {
        self.queue = queue
        self.text = text
    }
    
    typealias Completion = (CGSize, CGImage?) -> Void
    func draw(size: CGSize, completion: @escaping Completion) {
        queue.async {
            let size = self.measure(constrainedSize: size)
            completion(size, self.render(size: size))
        }
    }
    
    private func measure(constrainedSize: CGSize) -> CGSize {
        return text.boundingRect(with: constrainedSize, options: [.usesFontLeading, .usesLineFragmentOrigin], context: nil).size
    }
    
    private func render(size: CGSize) -> CGImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        
        text.draw(in: CGRect(origin: .zero, size: size))
        
        return UIGraphicsGetImageFromCurrentImageContext()?.cgImage
    }
}
