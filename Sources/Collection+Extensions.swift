//
//  Collection+Extensions.swift
//  SwiftToolkit
//
//  Created by Mikhail on 16.03.2022.
//  Copyright © 2022 Mikhail. All rights reserved.
//

import Foundation

public extension Collection {
    
    var fullRange: Range<Index> {
        return startIndex..<endIndex
    }
    
    func chunked(by size: Int) -> [[Element]] {
        
        precondition(size > 0)
        
        guard !isEmpty else {
            return []
        }
        
        var chunkStart = startIndex
        var chunks: [[Element]] = []
        while chunkStart < endIndex {
            let chunkEnd = index(chunkStart, offsetBy: size, limitedBy: endIndex) ?? endIndex
            let chunkRange = chunkStart..<chunkEnd
            chunks.append(Array(self[chunkRange]))
            chunkStart = chunkEnd
        }
        return chunks
    }
    
}

public extension Collection where Element: Equatable {
    
    func indices(of element: Element) -> [Index] {
        return indices.filter { self[$0] == element }
    }
    
}

public extension RangeReplaceableCollection where Element: Equatable {
    
    mutating func remove(_ element: Element) {
        while let index = firstIndex(of: element) {
            remove(at: index)
        }
    }
    
}
