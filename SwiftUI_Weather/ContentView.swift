//
//  ContentView.swift
//  SwiftUI_Weather
//
//  Created by Санжар Асанов on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack  {
                CityTextView(cityName: isNight ? "Bishkek" :  "Bishkek")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 4 : 19)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfweek: "TUE",
                                   imageName: isNight ? "aqi.high" :  "cloud.sun.fill",
                                   temperature: isNight ? 3 : 15)
                    WeatherDayView(dayOfweek: "WED",
                                   imageName: isNight ? "cloud.snow.fill" : "cloud.bolt.rain.fill",
                                   temperature:  isNight ? -2 : 3)
                    WeatherDayView(dayOfweek: "THU",
                                   imageName: isNight ? "cloud.drizzle.fill" : "cloud.sun.rain.fill",
                                   temperature: isNight ? 8 :  0)
                    WeatherDayView(dayOfweek: "FRI",
                                   imageName: isNight ? "tornado" : "cloud.snow.fill",
                                   temperature: isNight ? -3 :  -11)
                    WeatherDayView(dayOfweek: "SAT",
                                   imageName: isNight ? "wind" : "snow",
                                   temperature: isNight ? -6 :  -12)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroungColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfweek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfweek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint:.bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    var cityName: String
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

