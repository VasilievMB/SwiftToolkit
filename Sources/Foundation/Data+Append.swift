//
//  Data+Append.swift
//  SwiftToolkit
//
//  Created by Mikhail on 27/10/2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import Foundation

extension Data {
    
    /**
     Appends data to the end of file at given URL

     - Parameter fileURL: Target file URL.
     */
    
    func append(toFileAt fileURL: URL) throws {
        
        let handle = try FileHandle(forWritingTo: fileURL)
        defer {
            handle.closeFile()
        }
        
        handle.seekToEndOfFile()
        handle.write(self)
    }
    
}
