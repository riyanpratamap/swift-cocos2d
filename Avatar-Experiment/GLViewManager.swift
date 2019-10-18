//
//  GLViewManager.swift
//  students
//
//  Created by Wisnu Riyan on 05/08/19.
//  Copyright © 2019 Ruangguru. All rights reserved.
//

import Foundation

class GLViewManager {
    static let sharedManager = GLViewManager()
    private var glView: CCGLView?
    fileprivate init() {}
    
    func getGLAvatarView(parent: UIView) -> CCGLView? {
        // handle windows's height size that
        if self.glView == nil {
            let  glView = CCGLView(frame: parent.bounds, pixelFormat: kEAGLColorFormatRGB565)
                // CCGLView(frame: parent.bounds)
                // CCGLView(frame: parent.bounds, pixelFormat: kEAGLColorFormatRGB565)
            self.glView = glView
        } else {
            self.glView?.frame.size.height = parent.frame.height
        }
        
        return self.glView
    }
    
    func ejectGLAvatarView() {
        self.glView?.removeFromSuperview()
    }
}
