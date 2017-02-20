//
//  DetailViewController.swift
//  Flick
//
//  Created by Ekko Lin on 2/19/17.
//  Copyright © 2017 CodePath. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!

    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        
        // Do any additional setup after loading the view.
        let title = movie["title"] as? String
        titleLabel.text = title
        
        let overview = movie["overview"]
        overviewLabel.text = overview as? String
        overviewLabel.sizeToFit()
        
        fadingImage()   // Loading in an image from the network
        
        print(movie)    // Standard outputting details
    }
    
    
    func fadingImage() -> Void {
        if let posterPath = movie["poster_path"] as? String {
            
            // Setting poster view with high resoluton
            let smallImageRequest = URLRequest(url: (NSURL(string: "https://image.tmdb.org/t/p/w45" + posterPath)) as! URL)
            let largeImageRequest = URLRequest(url: (NSURL(string: "https://image.tmdb.org/t/p/original" + posterPath)) as! URL)
            
            
            posterView.setImageWith(smallImageRequest, placeholderImage: nil, success: {(smallImageRequest, smallImageResponse, smallImage) -> Void in
                
                self.posterView.alpha = 0.0
                self.posterView.image = smallImage
                
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    
                    self.posterView.alpha = 1.0
                    
                }, completion: { (sucess) -> Void in
                    
                    self.posterView.setImageWith(largeImageRequest as URLRequest, placeholderImage: smallImage, success: {
                        (largeImageRequest, LargeImageResponse, largeImage) ->Void in
                            self.posterView.image = largeImage;
                    },failure: {(request, response, error) -> Void in
                    })
                })
            },
            failure: { (imageRequest, imageResponse, error) -> Void in
                print("Failed")
            })
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
