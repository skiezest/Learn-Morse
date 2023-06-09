//
//  SwiftUIView.swift
//  
//
//  Created by Alex Cucos on 07.04.2023.
//

import SwiftUI

struct Speaker: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
                let width = rect.size.width
                let height = rect.size.height
                path.move(to: CGPoint(x: 0.46617*width, y: 0.84647*height))
                path.addCurve(to: CGPoint(x: 0.5264*width, y: 0.78624*height), control1: CGPoint(x: 0.5007*width, y: 0.84647*height), control2: CGPoint(x: 0.5264*width, y: 0.82038*height))
                path.addLine(to: CGPoint(x: 0.5264*width, y: 0.20424*height))
                path.addCurve(to: CGPoint(x: 0.46579*width, y: 0.14286*height), control1: CGPoint(x: 0.5264*width, y: 0.1701*height), control2: CGPoint(x: 0.5007*width, y: 0.14286*height))
                path.addCurve(to: CGPoint(x: 0.40325*width, y: 0.17393*height), control1: CGPoint(x: 0.44353*width, y: 0.14286*height), control2: CGPoint(x: 0.42704*width, y: 0.15206*height))
                path.addLine(to: CGPoint(x: 0.24787*width, y: 0.31857*height))
                path.addCurve(to: CGPoint(x: 0.2402*width, y: 0.32164*height), control1: CGPoint(x: 0.24557*width, y: 0.32049*height), control2: CGPoint(x: 0.24327*width, y: 0.32164*height))
                path.addLine(to: CGPoint(x: 0.13354*width, y: 0.32164*height))
                path.addCurve(to: CGPoint(x: 0.03571*width, y: 0.42407*height), control1: CGPoint(x: 0.07024*width, y: 0.32164*height), control2: CGPoint(x: 0.03571*width, y: 0.3577*height))
                path.addLine(to: CGPoint(x: 0.03571*width, y: 0.56602*height))
                path.addCurve(to: CGPoint(x: 0.13354*width, y: 0.66807*height), control1: CGPoint(x: 0.03571*width, y: 0.63239*height), control2: CGPoint(x: 0.07024*width, y: 0.66807*height))
                path.addLine(to: CGPoint(x: 0.2402*width, y: 0.66807*height))
                path.addCurve(to: CGPoint(x: 0.24749*width, y: 0.67076*height), control1: CGPoint(x: 0.24288*width, y: 0.66807*height), control2: CGPoint(x: 0.24557*width, y: 0.66884*height))
                path.addLine(to: CGPoint(x: 0.40325*width, y: 0.81655*height))
                path.addCurve(to: CGPoint(x: 0.46617*width, y: 0.84647*height), control1: CGPoint(x: 0.42512*width, y: 0.83726*height), control2: CGPoint(x: 0.44315*width, y: 0.84647*height))
                path.closeSubpath()
                path.move(to: CGPoint(x: 0.83524*width, y: 0.78317*height))
                path.addCurve(to: CGPoint(x: 0.90008*width, y: 0.76897*height), control1: CGPoint(x: 0.85787*width, y: 0.7966*height), control2: CGPoint(x: 0.8855*width, y: 0.79122*height))
                path.addCurve(to: CGPoint(x: 0.98103*width, y: 0.49428*height), control1: CGPoint(x: 0.95149*width, y: 0.69263*height), control2: CGPoint(x: 0.98103*width, y: 0.59556*height))
                path.addCurve(to: CGPoint(x: 0.90008*width, y: 0.21959*height), control1: CGPoint(x: 0.98103*width, y: 0.393*height), control2: CGPoint(x: 0.95187*width, y: 0.29517*height))
                path.addCurve(to: CGPoint(x: 0.83524*width, y: 0.20501*height), control1: CGPoint(x: 0.8855*width, y: 0.19734*height), control2: CGPoint(x: 0.85787*width, y: 0.19196*height))
                path.addCurve(to: CGPoint(x: 0.82411*width, y: 0.27752*height), control1: CGPoint(x: 0.8103*width, y: 0.21997*height), control2: CGPoint(x: 0.80723*width, y: 0.25028*height))
                path.addCurve(to: CGPoint(x: 0.88588*width, y: 0.49428*height), control1: CGPoint(x: 0.86363*width, y: 0.33775*height), control2: CGPoint(x: 0.88588*width, y: 0.41448*height))
                path.addCurve(to: CGPoint(x: 0.82411*width, y: 0.71104*height), control1: CGPoint(x: 0.88588*width, y: 0.57408*height), control2: CGPoint(x: 0.86325*width, y: 0.65043*height))
                path.addCurve(to: CGPoint(x: 0.83524*width, y: 0.78317*height), control1: CGPoint(x: 0.80723*width, y: 0.73828*height), control2: CGPoint(x: 0.8103*width, y: 0.76859*height))
                path.closeSubpath()
                path.move(to: CGPoint(x: 0.6626*width, y: 0.67651*height))
                path.addCurve(to: CGPoint(x: 0.72552*width, y: 0.665*height), control1: CGPoint(x: 0.68408*width, y: 0.68994*height), control2: CGPoint(x: 0.71132*width, y: 0.68495*height))
                path.addCurve(to: CGPoint(x: 0.77846*width, y: 0.49428*height), control1: CGPoint(x: 0.75889*width, y: 0.61935*height), control2: CGPoint(x: 0.77846*width, y: 0.55835*height))
                path.addCurve(to: CGPoint(x: 0.72552*width, y: 0.32317*height), control1: CGPoint(x: 0.77846*width, y: 0.43021*height), control2: CGPoint(x: 0.75889*width, y: 0.36921*height))
                path.addCurve(to: CGPoint(x: 0.6626*width, y: 0.31205*height), control1: CGPoint(x: 0.71132*width, y: 0.30361*height), control2: CGPoint(x: 0.68408*width, y: 0.29824*height))
                path.addCurve(to: CGPoint(x: 0.65301*width, y: 0.38724*height), control1: CGPoint(x: 0.63881*width, y: 0.32701*height), control2: CGPoint(x: 0.63344*width, y: 0.35578*height))
                path.addCurve(to: CGPoint(x: 0.68293*width, y: 0.49428*height), control1: CGPoint(x: 0.67257*width, y: 0.4164*height), control2: CGPoint(x: 0.68293*width, y: 0.45438*height))
                path.addCurve(to: CGPoint(x: 0.65301*width, y: 0.60132*height), control1: CGPoint(x: 0.68293*width, y: 0.5338*height), control2: CGPoint(x: 0.67219*width, y: 0.57178*height))
                path.addCurve(to: CGPoint(x: 0.6626*width, y: 0.67651*height), control1: CGPoint(x: 0.63344*width, y: 0.63316*height), control2: CGPoint(x: 0.63881*width, y: 0.66155*height))
                path.closeSubpath()
                return path
    }
}
