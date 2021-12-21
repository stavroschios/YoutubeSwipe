//  Home.swift
//  VideoPlayerWithGesture
//
//  Created by Stavros Pachoundakis on 2021-11-29.
//


import Foundation
import SwiftUI
import BottomSheet

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var iconWidth: CGFloat
    var tab: Tab
}


var tabItems = [
    TabItem(text: "Home", icon: "house.fill", iconWidth: 20, tab: .home),
    TabItem(text: "Shorts", icon: "bolt", iconWidth: 20, tab: .shorts),
    TabItem(text: "", icon: "plus.circle", iconWidth: 40, tab: .plus),
    TabItem(text: "Subs", icon:  "rectangle.stack.person.crop", iconWidth: 20, tab: .subs),
    TabItem(text: "Library", icon: "play.rectangle.on.rectangle", iconWidth: 20, tab: .library)
]

enum Tab: String {
    case home
    case shorts
    case plus
    case subs
    case library
    
}
struct Menu: View{
    @State var selectedTab: Tab = .home
    @State var plusClick = false
    @Environment (\.colorScheme) var colorScheme
    func askForNextState() -> ActionSheet {
        
        if plusClick  {
            let startPreview = ActionSheet.Button.default(Text("Create a short")) {
                   
                   }
            let upload = ActionSheet.Button.default(
                Text("Upload a video")) {
                   
                   }
            let cancel = ActionSheet.Button.destructive(Text("Go live")){}
                    
            return ActionSheet(title: Text("Create"), message: Text(""), buttons: [startPreview, upload, cancel])
         
        }
        else {
            let startPreview = ActionSheet.Button.default(Text("Create a short")) {
                   
                   }
            let upload = ActionSheet.Button.default(
                Text("Upload a video")) {
                   
                   }
            let cancel = ActionSheet.Button.destructive(Text("Go live")){}
                    
            return ActionSheet(title: Text("Create"), message: Text(""), buttons: [startPreview, upload, cancel])
         
        }
    }
    
    var body: some View{
        ZStack(alignment: .bottom){
       
            Home()
   
            
    
//            switch selectedTab {
//            case .home:
//                Home()
//            case .shorts:
//                Shorts()
//            case .plus:
//                EmptyView()
//
//            case .subs:
//                Subs()
//            case .library:
//                Library()
//            }
        
        Spacer()
        
        VStack{
            
            HStack(spacing: 30){
                
                ForEach(tabItems) { item in
                    Button(action: {}) {
                        Button {
                            bottomSheetPosition = .middle
                            
                            if selectedTab == .plus {
                                plusClick.toggle()
                            }
                            selectedTab = item.tab
                            
                        } label: {
                            VStack{
                       
                        Image(systemName: item.icon)
                            .font(.system(size: item.iconWidth))
                            
                        Text("\(item.text)")
                            .font(.caption2)
                            .lineLimit(1)
                    }
                        .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                    .frame(maxWidth: .infinity)
                        }.foregroundStyle(.primary)
                        
                }
                }
            }
            
            .padding(.top, 14)
            .padding(.horizontal, 8)
            .frame(height: 88, alignment: .top)
            .background(
                Rectangle().fill(colorScheme == .light ? Color.white : Color.black)
                        )
            
            .ignoresSafeArea(.all, edges: .all)
            
                
        }.shadow(radius: 10)
                .offset(y: 40)
        }
//        .actionSheet(isPresented: $plusClick, content: askForNextState)
        .bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, title: "Create", content: {
            
//
//            let startPreview = ActionSheet.Button.default(Text("Create a short")) {
//
//                   }
//            let upload = ActionSheet.Button.default(
//                Text("Upload a video")) {
//
//                   }
//            let cancel = ActionSheet.Button.destructive(Text("Go live")){}
//
//            return ActionSheet(title: Text("Create"), message: Text(""), buttons: [startPreview, upload, cancel])
            
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10){
                    
           
                    Button(action: {bottomSheetPosition = .hidden}) {
                        HStack(spacing: 10) {
                            VStack {
                        Image(systemName: "livephoto")
                                .font(.title)
                               
                                .frame(width: 50, height: 50)
                               
                            } .background(
                                Color.gray
                                    .cornerRadius(50)
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    
                            )
                                
                        Text("Go live")
                        }
                    }.foregroundColor(Color.black)
                        
                    Button(action: {bottomSheetPosition = .hidden}) {
                        HStack(spacing: 10) {
                            VStack {
                        Image(systemName: "video.and.waveform")
                                .font(.title)
                               
                                .frame(width: 50, height: 50)
                               
                            } .background(
                                Color.gray
                                    .cornerRadius(50)
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    
                            )
                                
                        Text("Create a short")
                        }
                    }.foregroundColor(Color.black)
                        
                    Button(action: {bottomSheetPosition = .hidden}) {
                        HStack(spacing: 10) {
                            VStack {
                        Image(systemName: "arrow.up")
                                .font(.title)
                               
                                .frame(width: 50, height: 50)
                               
                            } .background(
                                Color.gray
                                    .cornerRadius(50)
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    
                            )
                                
                        Text("Upload a video")
                        }
                    }.foregroundColor(Color.black)
                    Button(action: {bottomSheetPosition = .hidden}) {
                        HStack(spacing: 10) {
                            VStack {
                        Image(systemName: "xmark")
                                .font(.title)
                               
                                .frame(width: 50, height: 50)
                               
                            } .background(
                                Color.gray
                                    .cornerRadius(50)
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    
                            )
                                
                        Text("Close")
                        }
                    }.foregroundColor(Color.black)
                        
                }
            }
        })
        
      
        
    }
    @State private var bottomSheetPosition: BottomSheetPosition = .hidden

}


struct This_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
            .previewDevice("iPhone 13")
    }
}
