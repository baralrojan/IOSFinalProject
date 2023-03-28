//
//  ViewController.swift
//  NewsPortal
//
//  Created by user231854 on 3/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var artilcesList = [ArticleData]()
    //@IBOutlet weak var myTableView: UITableView!
    
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData()
    {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=fc1b5e8749cc44ac9c8f023248140a7a")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            guard let data = data, error == nil else
            {
                print("Error occured while accessing data")
                return
            }
            var newsFullList:NewsData?
            do
            {
                newsFullList = try JSONDecoder().decode(NewsData.self, from: data)
            }
            catch
            {
                    print("Error Occured while accessing JSON \(error)")
            }
            self.artilcesList = newsFullList!.articles
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
                
        })
            dataTask.resume()
    }

}

    extension UIImageView
{
        func downloadImage(from url:URL)
        {
            contentMode = .scaleToFill
            let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
                (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                      let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                      let data = data, error == nil,
                      let image = UIImage(data: data)
                else{
                    return
                }
                DispatchQueue.main.async {
                    self.image = image
                }
                      
            })
            dataTask.resume()
        }
    }

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artilcesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        if artilcesList[indexPath.row].author != nil
        {
            cell.myLabel2.text = "Author: \(artilcesList[indexPath.row].author!)"
        }
        else
        {
            cell.myLabel2.text = "No Author"
        }
        cell.myLabel1.text = artilcesList[indexPath.row].title
        if artilcesList[indexPath.row].urlToImage != nil
        {
            let url = URL(string: artilcesList[indexPath.row].urlToImage!)
            cell.myImageView.downloadImage(from: url!)
            cell.myImageView.contentMode = .scaleToFill
        }
        else
        {
            cell.myImageView.image = UIImage(named: "image")
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsContentHome") as? NewsContentHomepageViewController
        vc?.newsContent = artilcesList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}



