//
//  UpCollectionViewController.swift
//  MobUpGallery
//
//  Created by Абдулла Залимханов on 25.07.2021.
//

import UIKit
import VK_ios_sdk

class UpCollectionViewController: UICollectionViewController {
    
    // MARK: NavigationItem
    
    fileprivate func configureLogOutButton() {
        
        navigationItem.title = "Mobile Up Gallery"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выход", style: .plain, target: self, action: #selector(handleLogOut))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc fileprivate func handleLogOut() {
        
        print("log out")
        
        // set up alert controller
        let alert = UIAlertController(title: "Вы уверены?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: {  (_) in
            print("tapped")
            
            do {
                let AuthVC = UIStoryboard(name: "AuthViewController", bundle: nil).instantiateInitialViewController() as! AuthViewController
                let navController = UINavigationController(rootViewController: AuthVC)
                navController.modalPresentationStyle = .fullScreen
                self.present(navController, animated: true, completion: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Photo
    
    let photos = ["image1","image2","image3","image4","image5","image6","image7","image8","image9","image10","image11","image12","image13","image14","image15","image16","image17"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLogOutButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! UpCollectionViewCell
            photoVC.image = cell.imageView.image
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upCell", for: indexPath) as! UpCollectionViewCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.imageView.image = image
        return cell
    }
    
}


extension UpCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 2 * (itemsPerRow + 0)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 1, bottom: 2, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
    }
    
    
}
