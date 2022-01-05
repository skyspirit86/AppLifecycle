//
//  ViewController.swift
//  Lifecycle
//
//  Created by Zolt Varga on 01/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("🟢 \(#function)")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        print("🟢 \(#function)")
    }
    
    override func loadView() {
        super.loadView()
        
        print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        
        print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("🟢 State: \(UIApplication.shared.applicationState.toString())")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("🟢 State: \(UIApplication.shared.applicationState.toString())")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
    }
    
    deinit {
        print("🟢 deinit")
    }
}

