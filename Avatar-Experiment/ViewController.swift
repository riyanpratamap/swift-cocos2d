//
//  ViewController.swift
//  Avatar-Experiment
//
//  Created by Akip Maulana on 06/10/19.
//  Copyright © 2019 Akirah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var avatarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Experiment"
        
        let glView = GLViewManager.sharedManager.getGLAvatarView(parent: self.avatarView)
        if let aView = glView {
            aView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.avatarView.insertSubview(aView, at: 0)
        }
        
        CCDirector.shared()?.view = glView
        
        let scene: CCScene? = AvatarNode.scene(withScale: 0.3, andSkins: nil)
        // scene(withScale: 0.6, withAtlases: atlases, andSkins: skins)
        
        if CCDirector.shared()?.runningScene == nil {
            CCDirector.shared()?.run(with: scene)
        } else {
            CCDirector.shared()?.replace(scene)
        }
        CCDirector.shared()?.startAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

