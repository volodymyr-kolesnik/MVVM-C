//
//  TimeEaterFlowController.swift
//  MealTime
//
//  Created by Igor Kupreev on 9/16/18.
//  Copyright © 2018 Igor Kupreev. All rights reserved.
//

import UIKit


class TimeEaterFlowController: UIViewController {

    @IBOutlet private var table: UITableView!
    var files = [String]()
    var isNeedToReload: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fm = FileManager.default
        if let path = Bundle.main.resourcePath,
            let items = try? fm.contentsOfDirectory(atPath: path){
            for item in items where item.hasPrefix("img"){
                files.append(item)
            }
        }
        
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isNeedToReload ?? false {
            isNeedToReload = nil
            table.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapCloseButton(sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}




extension TimeEaterFlowController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let file = files[indexPath.row]
        if let path = Bundle.main.path(forResource: file, ofType: "") {
            
            if let image = MemoryCache.shared.images[path] {
                cell.customImageView.image = image
            } else {
                DispatchQueue.global(qos: .background).async {
                    let img = UIImage(contentsOfFile: path)
                    
                    var resizedImage: UIImage?
                    
                    if let image = img {
                        resizedImage = self.resizeImage(image: image, targetSize: CGSize(width: image.size.width / 4, height: image.size.height / 4))
                    }
                        
                    DispatchQueue.main.async {
                        cell.customImageView?.image = resizedImage
                        
                        if let loadedImg = resizedImage {
                            MemoryCache.shared.set(loadedImg, forKey: path)
                        }
                    }
                }
            }
        }
        
        if let iv = cell.customImageView {
            iv.contentMode = .scaleAspectFill
            iv.layer.shadowColor = UIColor.darkGray.cgColor
            iv.layer.shadowOpacity = 0.8
            iv.layer.shadowRadius = 12
        }
        
        return cell
    }

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}

extension TimeEaterFlowController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = TimeEaterChildViewController()
        
        details.file = files[indexPath.row]
        details.owner = self
        
        navigationController?.pushViewController(details, animated: true)
        
    }
}
