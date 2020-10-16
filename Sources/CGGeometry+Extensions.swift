//
//  CGGeometry+Extensions.swift
//  SwiftToolkit
//
//  Created by Mikhail on 16.10.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import CoreGraphics

public extension CGVector {
    
    init(point: CGPoint) {
        self.init(dx: point.x, dy: point.y)
    }
    
    init(angle: CGFloat) {
        self.init(dx: cos(angle), dy: sin(angle))
    }
    
    func length() -> CGFloat {
        return sqrt(lengthSquared())
    }
    
    func lengthSquared() -> CGFloat {
        return dx * dx + dy * dy
    }
    
    func normalized() -> CGVector {
        let length = self.length()
        if length > 0 {
            return self * (1 / length)
        } else {
            return .zero
        }
    }
    
    mutating func normalize() {
        self = normalized()
    }
        
    var angle: CGFloat {
        return atan2(dy, dx)
    }
    
    static func + (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }
    
    static func += (left: inout CGVector, right: CGVector) {
        left = left + right
    }
    
    static func - (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }
    
    static func -= (left: inout CGVector, right: CGVector) {
        left = left - right
    }
    
    static func * (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx * right.dx, dy: left.dy * right.dy)
    }
    
    static func *= (left: inout CGVector, right: CGVector) {
        left = left * right
    }
    
    static func * (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    static func *= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector * scalar
    }
    
    static func lerp(start: CGVector, end: CGVector, t: CGFloat) -> CGVector {
        return start + (end - start) * t
    }
    
}

public extension CGPoint {
    
    init(vector: CGVector) {
        self.init(x: vector.dx, y: vector.dy)
    }
    
    func distanceSquared(to point: CGPoint) -> CGFloat {
        return (CGVector(point: point) - CGVector(point: self)).lengthSquared()
    }
    
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(distanceSquared(to: point))
    }
    
    func offset(by vector: CGVector) -> CGPoint {
        return CGPoint(x: x + vector.dx, y: y + vector.dy)
    }
    
    static func lerp(start: CGPoint, end: CGPoint, t: CGFloat) -> CGPoint {
        return CGPoint(x: start.x + (end.x - start.x) * t,
                       y: start.y + (end.y - start.y) * t)
    }
    
}

public extension CGSize {
    
    init(vector: CGVector) {
        self.init(width: vector.dx, height: vector.dy)
    }
    
    var aspectRatio: CGFloat {
        return width / height
    }
    
    static func * (size: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: size.width * scalar, height: size.height * scalar)
    }
        
    func fitting(_ size: CGSize) -> CGSize {
        let scale = min(size.width / self.width, size.height / self.height)
        return self * scale
    }
    
    func filling(_ size: CGSize) -> CGSize {
        let scale = max(size.width / self.width, size.height / self.height)
        return self * scale
    }
    
}

public extension CGRect {
    
    var center: CGPoint {
        get {
            return CGPoint(x: midX, y: midY)
        }
        set {
            origin = CGPoint(x: newValue.x - 0.5 * width,
                             y: newValue.y - 0.5 * height)
        }
    }
    
    func fitting(_ rect: CGRect) -> CGRect {
        let size = self.size.fitting(rect.size)
        let origin = CGPoint(x: rect.minX + 0.5 * (rect.width - size.width),
                             y: rect.minY + 0.5 * (rect.height - size.height))
        return CGRect(origin: origin, size: size)
    }
    
    func filling(_ rect: CGRect) -> CGRect {
        let size = self.size.filling(rect.size)
        let origin = CGPoint(x: rect.minX + 0.5 * (rect.width - size.width),
                             y: rect.minY + 0.5 * (rect.height - size.height))
        return CGRect(origin: origin, size: size)
    }
    
}
