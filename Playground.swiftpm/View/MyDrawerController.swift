//
//  MyDrawerController.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import UIKit

class MyDrawerController: DrawerController {
    override var preferredContentHeight: CGFloat {
        if UIDevice.current.orientation.isLandscape {
            return 200
        } else {
            return 500
        }
    }
}
