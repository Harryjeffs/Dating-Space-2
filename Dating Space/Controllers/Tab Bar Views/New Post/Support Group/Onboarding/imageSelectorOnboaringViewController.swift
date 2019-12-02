//
//  imageSelectorOnboaringViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 9/11/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import YPImagePicker
import NSFWDetector

class imageSelectorOnboaringViewController: UIViewController {
    
    let addButton = UIButton()
    var collectionView : UICollectionView!
    
    var numberOfPhotos = 0
    var selectedImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        addButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addButton.roundCorners(corners: .allCorners, radius: addButton.height / 2)
        addButton.backgroundColor = .flatSkyBlueColor()
        addButton.setIcon(icon: .icofont(.plus), color: .white, forState: .normal)
        addButton.backgroundColor = .flatWhiteColor()
        addButton.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        addButton.dropShadow()
        view.addSubview(addButton)
        addButton.anchorInCenter(width: addButton.width, height: addButton.height)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.frame = view.bounds
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ident")
        collectionView.isHidden = true
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        
    }
    
    @objc func showImagePicker(){
        DispatchQueue.main.async {
            var config = YPImagePickerConfiguration()
            config.isScrollToChangeModesEnabled = true
            config.onlySquareImagesFromCamera = false
            config.usesFrontCamera = false
            config.showsPhotoFilters = true
            config.shouldSaveNewPicturesToAlbum = false
            config.startOnScreen = .library
            config.screens = [.library, .photo]
            config.showsCrop = .none
            config.targetImageSize = YPImageSize.original
            config.hidesStatusBar = true
            config.hidesBottomBar = false
            config.preferredStatusBarStyle = UIStatusBarStyle.default
            config.library.maxNumberOfItems = 5
            
            let picker = YPImagePicker(configuration: config)
            
            var nsfwCount = 0
            
            picker.didFinishPicking { [unowned picker] items, _ in
                for item in items {
                    switch item {
                    case .photo(let photo):
                         NSFWDetector.shared.check(image: photo.modifiedImage ?? photo.image, completion: { result in
                            switch result {
                            case let .success(nsfwConfidence: confidence):
                                print("NSFW Confidence",confidence)
                                if confidence > 0.9 {
                                    nsfwCount += 1
                                } else {
                                    if confidence > 0.5{
                                        onboaringData.nsfwFlag = true
                                    }
                                    self.selectedImages.append(photo.modifiedImage ?? photo.image)
                                }
                            default:
                                break
                            }
                        })
                    case .video(let video):
                        print(video)
                    }
                }
                if nsfwCount > 0{
                    EZAlertController.alert("Things are gettings hot in here.", message: "Hey, we couldn't help but notice some very revealing photos you tried to upload. Impress your future lover with your personality, not your body. ")
                }
                self.numberOfPhotos = items.count
                self.collectionView.isHidden = false
                self.collectionView.reloadData()
                picker.dismiss(animated: true, completion: nil)
                onboaringData.photos = self.selectedImages
                newPost().createInitalPost({_ in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    NotificationCenter.default.post(name: Notification.Name("toNextPage"), object: nil)
                })
                
            }
            self.present(picker, animated: true, completion: nil)
        }
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
extension imageSelectorOnboaringViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0,1:
            return CGSize(width: (UIScreen.main.bounds.width - 16) / 2, height: (UIScreen.main.bounds.width - 16) / 2)
        default:
            return CGSize(width: (UIScreen.main.bounds.width - 32) / 3, height:  (UIScreen.main.bounds.width) / 3)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfPhotos
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ident", for: indexPath)
        cell.backgroundColor = .red
        
        let imageContainer = UIImageView(frame: cell.frame)
        imageContainer.image = selectedImages[indexPath.row]
    
        cell.addSubview(imageContainer)
        return cell
    }
}
