//
//  ViewController.swift
//  ATurkcellCustomComponent
//
//  Created by Sefa Aycicek on 1.10.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let parameters = ["name", "surname", "age", "country", "city", "town"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        var lastView : UIView? = nil
        //(0..<5).forEach { _ in
        /*parameters.forEach { item in
            let tempView = self.addCustomTextField(customTag: item, topView: lastView)
            lastView = tempView
        }*/
        
        parameters.forEach { item in
            let tempView = self.addCustomTextField2(customTag: item, topView: lastView)
            lastView = tempView
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func addCustomTextField2(customTag : String, topView : UIView? = nil) -> UIView {
        let customView = MyTextField()
        customView.customTag = customTag
        customView.placeholder = customTag
        customView.borderStyle = .roundedRect
        //customView.backgroundColor = .red
        customView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customView)
        
        
        var constraints = [NSLayoutConstraint]()
        
        if let topView = topView {
            constraints.append(customView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20))
        } else {
            constraints.append(customView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100))
        }
        constraints.append(customView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10))
        constraints.append(customView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10))
        constraints.append(customView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        constraints.append(customView.heightAnchor.constraint(equalToConstant: 34))
        
        NSLayoutConstraint.activate(constraints)
        
        return customView
    }
    
    func addCustomTextField(customTag : String, topView : UIView? = nil) -> UIView {
        let customView = MyTextField()
        customView.customTag = customTag
        customView.placeholder = customTag
        customView.borderStyle = .roundedRect
        //customView.backgroundColor = .red
        
        self.view.addSubview(customView)
        
        customView.snp.makeConstraints { make in
            if let topView = topView {
                make.top.equalTo(topView.snp.bottom).offset(20)
            } else {
                make.top.equalToSuperview().offset(100)
            }
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            //make.width.height.equalTo(100)
            make.height.equalTo(34)
        }
        
        return customView
    }
    
    func addCustomView(topView : UIView? = nil) -> UIView {
        let customView = UIView()
        customView.backgroundColor = .red
        
        self.view.addSubview(customView)
        
        customView.snp.makeConstraints { make in
            if let topView = topView {
                make.top.equalTo(topView.snp.bottom).offset(20)
            } else {
                make.top.equalToSuperview().offset(100)
            }
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            //make.width.height.equalTo(100)
            make.height.equalTo(100)
        }
        
        return customView
    }
    
    var values : [String:String] = [:]
    func saveForm() {
        self.view.subviews.forEach { item in
            print(item.frame)
            if item is MyTextField {
                let textField = (item as! MyTextField)
                values[textField.customTag] = textField.text
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        saveForm()
    }
}

class MyTextField : UITextField {
    var customTag : String!
}
