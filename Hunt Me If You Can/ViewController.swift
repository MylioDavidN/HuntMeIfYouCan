//
//  ViewController.swift
//  Hunt Me If You Can
//
//  Created by David T. Nguyen on 7/15/16.
//  dunguk@gmail.com
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    
        var V1 : View1 = View1(nibName: "View1", bundle: nil)

        var V2 : View2 = View2(nibName: "View2", bundle: nil)
        
        var V3 : View3 = View3(nibName: "View3", bundle: nil)
        
        self.addChildViewController(V1)
        self.scrollView.addSubview(V1.view)
        V1.didMoveToParentViewController(self)
        
        self.addChildViewController(V2)
        self.scrollView.addSubview(V2.view)
        V2.didMoveToParentViewController(self)
        
        var V2Frame : CGRect = V2.view.frame
        V2Frame.origin.x = self.view.frame.width
        V2.view.frame = V2Frame
        
        var V3Frame : CGRect = V3.view.frame
        V3Frame.origin.x = self.view.frame.width * 2
        V3.view.frame = V3Frame

        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.height)
    
    
    
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

