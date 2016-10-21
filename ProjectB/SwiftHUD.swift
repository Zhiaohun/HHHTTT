//
//  SwiftHUD.swift
//  ProjectB
//
//  Created by long on 2016/10/20.
//  Copyright © 2016年 long. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class SwiftHUD: UIViewController,NVActivityIndicatorViewable {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func startLoadHUD() -> Void {
        let size = CGSize(width: 100, height: 100)
        startAnimating(size, message: "正在努力加载...", type: NVActivityIndicatorType.orbit, color: UIColor.init(red: 17/255.0, green: 255/255.0, blue: 244/255.0, alpha: 1), padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil)
        
    }
    
    func stopLoadHUD() -> Void {
        stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
