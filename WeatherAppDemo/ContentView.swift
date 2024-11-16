//
//  ContentView.swift
//  WeatherAppDemo
//
//  Created by Palakkumar Darji on 14/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDayTime: Bool = true
    
    var body: some View {
        ZStack {
            let theme = if isDayTime {
                Gradient(colors: [.blue, Color("LightBlue")])
            } else {
                Gradient(colors: [ .black, .gray, .gray])
            }
            LinearGradient(
                gradient: theme,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                Text("Bangalore")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .bold(true)
                
                VStack(spacing: 4) {
                    Image(systemName: "cloud.sun.bolt.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("20°C")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
                
                HStack {
                    ExtractedView(dayName: "MON", imageName: "cloud.sun.bolt.fill", degreesTemp: 20)
                    ExtractedView(dayName: "TUE", imageName: "cloud.sun.fill", degreesTemp: 20)
                    ExtractedView(dayName: "WED", imageName: "sunset.fill", degreesTemp: 20)
                    ExtractedView(dayName: "THU", imageName: "snow", degreesTemp: 20)
                    ExtractedView(dayName: "FRI", imageName: "cloud.sun.bolt.fill", degreesTemp: 20)
                    ExtractedView(dayName: "SAT", imageName: "cloud.sun.bolt.fill", degreesTemp: 20)
                    ExtractedView(dayName: "SUN", imageName: "cloud.sun.bolt.fill", degreesTemp: 20)
                }
                Spacer()
                
                Button(action: {
                    isDayTime = !isDayTime
                }, label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                })
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    let dayName: String
    let imageName: String
    let degreesTemp: Int
    
    var body: some View {
        VStack {
            Text(dayName)
            Image(systemName: imageName)
            Text("\(degreesTemp)")
                .font(.system(size: 20))
        
        }
    }
}
