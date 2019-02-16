//
//  CameraViewController.swift
//  Instagram
//
//  Created by 이승헌 on 13/02/2019.
//  Copyright © 2019 individual. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse
class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var image_view: UIImageView!
    
    @IBOutlet weak var comment_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["caption"] = comment_field.text
        post["author"] = PFUser.current()
        
        
        let image_data = image_view.image!.pngData()
        let file = PFFileObject(data: image_data!)
        post["image"] = file
        post.saveInBackground{ (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("Error: \(String(describing: error))")
            }
        }
    }
    
    @IBAction func image_view_clicked(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        let size = CGSize(width: 300, height: 300)
        let scaled_image = image?.af_imageScaled(to: size)
        image_view.image = scaled_image
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}