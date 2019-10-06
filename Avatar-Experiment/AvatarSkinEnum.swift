//
//  AvatarSkinEnum.swift
//  students
//
//  Created by Wisnu Riyan on 18/09/19.
//  Copyright © 2019 Ruangguru. All rights reserved.
//

import Foundation

enum SkinType: String {
    case hairType = "HAIR"
    case face = "FACE"
    case skinColor = "SKIN_COLOR"
    case top = "TOP"
    case bottom = "BOTTOM"
    case shoes = "SHOES"
    
    func value() -> NSString {
        return self.rawValue as NSString
    }
}

@objc
class AvatarSkinTypeEnum: NSObject {
    @objc
    class func HairType() -> NSString {
        return SkinType.hairType.value()
    }
    
    @objc
    class func Face() -> NSString {
        return SkinType.face.value()
    }
    
    @objc
    class func SkinColor() -> NSString {
        return SkinType.skinColor.value()
    }
    
    @objc
    class func Top() -> NSString {
        return SkinType.top.value()
    }
    
    @objc
    class func Bottom() -> NSString {
        return SkinType.bottom.value()
    }
    
    @objc
    class func Shoes() -> NSString {
        return SkinType.shoes.value()
    }
}

@objc
class PairOfSkin: NSObject {
    var type: String
    var skin: String
    
    @objc
    init(type: String, skin: String) {
        self.type = type
        self.skin = skin
    }
    
    @objc
    public func getType() -> String {
        return self.type
    }
    
    @objc
    public func getSkin() -> String {
        return self.skin
    }
}
