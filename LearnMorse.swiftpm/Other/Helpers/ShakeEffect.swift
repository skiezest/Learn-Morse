//
//  File.swift
//  
//
//  Created by Alex Cucos on 02.04.2023.
//
// Inspired by objc.io: https://objc.io/blog/2019/10/01/swiftui-shake-animation/

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var travelDistance : CGFloat = 6
    var numOfShakes : CGFloat = 4
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
        travelDistance * sin(animatableData * .pi * numOfShakes), y: 0))
    }
}
