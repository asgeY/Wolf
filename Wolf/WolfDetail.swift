//
//  WolfDetail.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/18/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//

import SwiftUI


struct WolfDetail: View {
    var Wolves: Wolves
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    // MARK: PLACEDETAIL BODY
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(Wolves.title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color.white)
                            Text(Wolves.subtitle)
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        Spacer()
                        ZStack {
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }
                        }
                    }
                    Spacer()
                    Image(Wolves.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 180, alignment: .top)
                    
                }
                .padding(.bottom, 50)
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
                    //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
                    .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                    .background(Wolves.color)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                   
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text(wolfBioDetail().0)
                    Text(wolfBioDetail().1)
                        .bold()
                        .font(.system(size: 20))
                        .underline()
                    Text(wolfBioDetail().2)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(wolfBioDetail().3)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // MARK: PLACE DETAIL METHODS
    func wolfBioDetail() -> (String, String, String, String) {
        var title:String
        var hightlightTitle:String
        var bodyOne:String
        var bodyTwo:String
        let unicodeHeart = "\u{2661}"
        
        switch activeIndex {
        case 0:
            title = "True Love \(unicodeHeart)"
            hightlightTitle = "Known as highly intelligent pack animals"
            bodyTwo = "wolves have been widely misunderstood through the millennia as wild and deadly beasts. They are the creatures of myth and folklore, often to their detriment. The truth is that wolves are extremely social animals that develop very close social bonds with family members and their pack. In fact, wolves observed in the wild often illustrate significant displays of affection and other emotions with each other."
            bodyOne = "Once a wolf has found a mate, they tend to stay together for better or worse, through sickness and health, often until death due them part. Of Wolves it is typically only the alpha male and female that breed, leaving the rest of the adult pack members to help rear the young and ensure their survival."
            return (title, hightlightTitle, bodyOne, bodyTwo)
        case 1:
            title = "Wolves are legendary"
            hightlightTitle = "Surviving mentality."
            bodyOne = "because of their spine-tingling howl, which they use to communicate. A lone wolf howls to attract the attention of his pack, while communal howls may send territorial messages from one pack to another. Some howls are confrontational. Calls may be answered by rival packs. Much like barking domestic dogs, wolves may simply begin howling because a nearby wolf has already begun."
            bodyTwo = "There are many subspecies of wolf including the Arctic wolf, all of which use a variety of howls to communicate to one another."
            return (title, hightlightTitle, bodyOne, bodyTwo)
        case 2:
            title = "Wolf Pack"
            hightlightTitle = "Wolves"
            bodyOne = "Wolves are not particularly fast, with a top speed of about 45km/h (28mph).  They instead rely on their hearing and sense of smell to detect prey.  They have remarkable powers of endurance and are known to follow their target all day and night if necessary"
            bodyTwo = "Wolf packs are established according to a strict hierarchy, with a dominant alpha male at the top and an alpha female not far behind. Usually this male and female are the only animals of the pack to breed. Packs consist of between five and ten animals – usually offspring from several years.  All of a pack’s adults help to care for young pups by bringing them food and watching them while others hunt."
            return (title, hightlightTitle, bodyOne, bodyTwo)
        default:
            title = ""
            hightlightTitle = ""
            bodyOne = ""
            bodyTwo = ""
            return (title, hightlightTitle, bodyOne, bodyTwo)
        }
    }
}

struct WolvesDetail_Previews: PreviewProvider {
    static var previews: some View {
        WolfDetail(Wolves: placeData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
    }
}
