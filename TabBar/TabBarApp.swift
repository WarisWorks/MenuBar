//
//  TabBarApp.swift
//  TabBar
//
//  Created by Waris Ruzi on 2022/11/02.
//

import SwiftUI

@main
struct TabBarApp: App {
    var body: some Scene {
        //        WindowGroup {
        //            ContentView()
        //        }
        
        MenuBarExtra {
            //MARK: Sample MacOS Control Center UI
            ControlCenterView()
        } label: {
            Image(systemName: "switch.2")
        }
        .menuBarExtraStyle(.window)
    }
    @ViewBuilder
    func ControlCenterView()->some View{
        //MARK: INSTEAD OF VSTACK . HSTACK
        Grid(horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow(alignment: .top) {
                VStack(spacing: 12){
                    ControlView(icon: "wifi.circle.fill", title: "Wi-Fi", subTitle: "تورۇم")
                    ControlView(icon: "wave.3.right.circle.fill", title: "Bluetooth", subTitle: "كونۇپكا")
                    ControlView(icon: "airplayvideo.circle.fill", title: "AirDrop", subTitle: "كۆپچىلىك")
                }
                .padding(12)
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.ultraThinMaterial)
                }

                Grid(verticalSpacing: 12){
                    GridRow {
                        HStack{
                            Image(systemName: "moon.circle.fill")
                                .font(.largeTitle)
                                .symbolRenderingMode(.multicolor)
                                .foregroundStyle(.purple, .primary)
                            
                            Text("ئاۋارە قىلماڭ")
                                .font(.custom(Uyghur, size: 12))
                                .foregroundColor(.primary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                       // .padding(12)
                        .background{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(.ultraThinMaterial)
                        }
                        .gridCellColumns(2)
                    }
                    
                    GridRow {
                        SubControlView(icon: "rectangle.3.group", title: "سەھنە\nباشقۇرۇش")
                        
                        SubControlView(icon: "rectangle.fill.on.rectangle.fill", title: "ئېكران \n تەسۋىر")
                        
//                        RoundedRectangle(cornerRadius: 12, style: .continuous)
//                            .fill(.white)
//                        RoundedRectangle(cornerRadius: 12, style: .continuous)
//                            .fill(.white)
                        
                    }
                }
                .gridCellUnsizedAxes(.vertical)
            }
            
            GridRow {
                VStack{
                    
                    DisabledSeeker(icon: "sun.max", title: "يورۇقلۇقى")
                    
                    DisabledSeeker(icon: "headphones", title: "ئاۋاز")
                       
                    
                }
                .gridCellColumns(2)                
            }
        }
        .padding(10)
        .frame(width: screenSize.width / 5.5)
        
    }
    
    
    //MARK: Disabled Seeker
    @ViewBuilder
    func DisabledSeeker(icon: String, title: String)->some View{
        VStack(alignment: .trailing, spacing: 5){
            Text(title)
                .font(.custom(Uyghur, size: 14))
                .foregroundColor(.primary)
            
            ZStack(alignment: .leading){
                Capsule()
                    .fill(.white)
                    .opacity(0.25)
                
                Image(systemName: icon)
                    .foregroundStyle(.thickMaterial)
                    .padding(.leading,8)
            }
            .frame(height: 25)
        }
        .padding(12)
        .background{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
    
    @ViewBuilder
    func SubControlView(icon: String, title: String)->some View{
        VStack(spacing: 4){
            Image(systemName: icon)
                .font(.title2)
            
            Text(title)
                .font(.custom(Uyghur, size: 12))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
    
    //MARK: CONTROL VIEW
    @ViewBuilder
    func ControlView(icon: String, title: String,subTitle: String)->some View{
        HStack(spacing: 5){
            Image(systemName: icon)
                .font(.largeTitle)
                .symbolRenderingMode(.multicolor)
                .foregroundStyle(.blue, .white)
            
            VStack(alignment: .leading, spacing: 1 ){
                Text(title)
                    .font(.callout)
                    .foregroundColor(.primary)
                
                Text(subTitle)
                    .font(.custom(Uyghur, size: 12))
                    .foregroundColor(.primary)
                    .opacity(0.7)
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    //MARK: MacOS ScreenSize
    var screenSize: CGSize = {
        guard let size = NSScreen.main?.visibleFrame.size else {
            return .zero
        }
        
        return size
    }()
}

//CTRL + I
// Fix Indentation
