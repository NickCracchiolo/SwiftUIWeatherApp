//
//  WeatherDayView.swift
//  Weather2
//
//  Created by Nicholas Cracchiolo on 10/8/20.
//

import SwiftUI

struct WeatherDayView: View {
    @State private var day: String = "Monday"
    let temps: [Double]
    let precipChance: [Double]
    
    private let barCornerRadius: CGFloat = 5.0
    
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Text(day)
                    .padding(.top)
                ZStack {
                    GeometryReader { proxy in
                        self.precipPath(proxy: proxy)
                        HStack(alignment: .bottom) {
                            ForEach(temps, id: \.self) { temp in
                                RoundedRectangle(cornerRadius: barCornerRadius, style: .circular)
                                    .frame(width: modifiedWidth(proxy: proxy), height: CGFloat(temp))
                                    .foregroundColor(Color.yellow)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func precipPath(proxy:GeometryProxy) -> Path {
        var path = Path()
        let frame = proxy.frame(in: .local)
        print("Local Frame: \(proxy.frame(in: .local))")
        print("Global Frame: \(proxy.frame(in: .global))")
        print("Height: \(proxy.size.height)")
        path.move(to: frame.max)
        for i in 0..<precipChance.count {
            let x = modifiedX(proxy: proxy, i: i)
            let y = modifiedY(proxy: proxy, percent: precipChance[i])
            print("x: \(x). y: \(y)")
            path.addLine(to: CGPoint(x: x, y: y))
        }
        //path.closeSubpath()
        return path
    }
    
    func modifiedWidth(proxy:GeometryProxy) -> CGFloat {
        let count = CGFloat(temps.count)
        let w = (proxy.size.width / count) - ((count - 1) * 0.75)
        print("Width: \(w)")
        return w
    }
    
    func modifiedX(proxy: GeometryProxy, i:Int) -> CGFloat {
        let count = CGFloat(precipChance.count)
        return (proxy.frame(in: .local).maxX / count) * CGFloat(i)
    }
    
    func modifiedY(proxy: GeometryProxy, percent: Double) -> CGFloat {
        return proxy.size.height - (proxy.size.height * CGFloat(percent / 100))
    }
}

struct WeatherDayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDayView(temps: [10,20,30,40,45,47,50,47,43,40,37], precipChance: [14,13,12,11,10,9,8,33,35,40,33,8])
            .previewLayout(PreviewLayout.fixed(width: 200, height: 100))
    }
}
