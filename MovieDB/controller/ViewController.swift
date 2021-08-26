//
//  ViewController.swift
//  MovieDB
//
//  Created by sachin singh on 25/08/21.
//

import UIKit

extension UIImageView {
        func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
            contentMode = mode
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            }.resume()
        }
        func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
            guard let url = URL(string: link) else { return }
            downloaded(from: url, contentMode: mode)
        }
}

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
   
    @IBOutlet var table1: UITableView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    var movie:[Movie]?
    
    // creating abda bda a ja rhaty array
    
    

        
     //MARK: lifecylce of view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movie = []
        
        let objNetworking = networking()
        
        activityIndicator.startAnimating()
        objNetworking.response(url: constant.server_base_url.rawValue) { mresult in
            DispatchQueue.main.async {
                self.movie = mresult.results
                self.table1.reloadData()
                
                self.activityIndicator.stopAnimating()
            }
            
            
        }
       
    }
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie?.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:CustomCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCellTableViewCell
        
        let movie = movie?[indexPath.row]
        
        cell.label1.text = movie?.title
        cell.label2.text = "\(String(describing: movie?.popularity!))"
        cell.label3.text = movie?.release_date
        
        if let urlstring = URL(string: constant.image_base_url.rawValue + (movie?.backdrop_path ?? "")) {
            cell.image1.downloaded(from: urlstring)
        }
        
        
        
    

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let movie = movie?[indexPath.row]
        
        let vc:detailViewController = self.storyboard?.instantiateViewController(identifier: "detail") as! detailViewController
        
         vc.detailmovie = movie
    
      
        navigationController?.pushViewController(vc , animated: true)
        
    }
    
}

