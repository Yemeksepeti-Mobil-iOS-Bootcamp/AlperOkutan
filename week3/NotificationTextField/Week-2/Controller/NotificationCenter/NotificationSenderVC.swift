//
//  NotificationSenderVC.swift
//  Week-2
//
//  Created by Kerim Caglar on 27.06.2021.
//

import UIKit

class NotificationSenderVC: UIViewController {

    var notificationData: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: Gönderilecek Data Kullanıcıdan Alınsın...
    //MARK: frame vs bound farkı nedir? Açıklayınız..
    
    /*
     Frame: Specifies the location and dimensions of the selected view according to the coordinate system inside the superview.
     Bound: It specifies the location and dimensions of the selected view according to the coordinate system within itself.
     */

    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func sendNotificationBtn(_ sender: Any) {
        guard let text = nameTextField.text else { return }
        notificationData["name"] = text
        
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: notificationData)
        dismiss(animated: true, completion: nil)
    }
    
}
