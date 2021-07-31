//
//  PhotoViewController.swift
//  MobUpGallery
//
//  Created by Абдулла Залимханов on 27.07.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var image: UIImage?
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBAction func shareAction(_ sender: Any) {
        
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Completion")
                
                let alert = UIAlertController(title: "Успешно!", message: "Изображение сохранено", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: { action in
                    print("tapped")
                }))
                
                self.present(alert, animated: true)
            }
            
        }
        
        present(shareController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = image
    }
    
    
}
