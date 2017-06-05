//
//  DatabaseViewController.swift
//  Web Service Portfolio
//
//  Created by Justin Tappert on 5/30/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit
import Alamofire

class DiscordViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var messageBodyField: UITextField!
    @IBOutlet weak var responseMessageLabel: UILabel!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    
    var messageString: String?
    let noMessageAlert = UIAlertController(title: "No Message", message: "Please enter a message to post to Discord", preferredStyle: .alert)
    
    let webhookUrl = "https://discordapp.com/api/webhooks/319951076742660097/d7r6soksSuGxv-fm_hj5JIUQiQmVSe7YFNSRuAUaA89MzU6vM1LRNeZCaOnRQ_S5Gkqe"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMessageButton.isEnabled = false
        messageBodyField.delegate = self
        
        // alert handling
        let action = UIAlertAction(title: "OK", style: .default) {
            (result: UIAlertAction) -> Void in
            print("OK")
        }
        noMessageAlert.addAction(action)
    }
    
    
    //MARK: UITextFieldDelagate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        messageBodyField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let message = messageBodyField.text {
            if (message.isEmpty || message == " ") {
                present(noMessageAlert, animated: true, completion: nil)
                return
            } else {
                messageString = message
                sendMessageButton.isEnabled = true
            }
        }
    }

    
    @IBAction func sendMessageButton(_ sender: UIButton) {
        let dataToSend: Parameters = [
            "content" : messageString!,
            "username" : "Justin",
            "avatar_url" : "http://walljack.xyz/meme/2016/12/funny-meme-faces-pictures-best-memes-faces-7-310x200.jpg"
        ]
        
        
        Alamofire.request(webhookUrl, method: .post, parameters: dataToSend, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print("Request was successfull")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
