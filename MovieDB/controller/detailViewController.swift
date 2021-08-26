//
//  detailViewController.swift
//  MovieDB
//
//  Created by sachin singh on 25/08/21.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet var detailImage: UIImageView!
    
    @IBOutlet var detailtitle: UILabel!
    
    @IBOutlet var detauilRelease: UILabel!
    
    @IBOutlet var detailpopularity: UILabel!
    
    var detailmovie:Movie?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailtitle.text =  detailmovie?.title
        
        detauilRelease.text = detailmovie?.release_date
        
        detailtitle.text = "\(String(describing: detailmovie?.popularity!))"
        
        if let urlstring = URL(string: constant.image_base_url.rawValue + (detailmovie?.backdrop_path ?? "")) {
            detailImage.downloaded(from: urlstring)
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
