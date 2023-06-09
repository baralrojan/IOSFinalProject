//
//  NewsContentHomepageViewController.swift
//  NewsPortal
//
//  Created by user231854 on 3/25/23.
//

import UIKit
import CoreData

class NewsContentHomepageViewController: UIViewController {
  
    @IBOutlet var myTitleNews: UILabel!
    @IBOutlet var myNewsContent: UILabel!
    @IBOutlet var newImage: UIImageView!
    var persistentContainer: NSPersistentContainer!
    var favArticle: [FavArticle]!
    
    var newsContent:ArticleData = ArticleData(author: "", title: "", urlToImage: "", content: "")
    
    @IBAction func toggleFav(_ sender: UIButton) {
        let moc = persistentContainer.viewContext
        if sender.currentImage == UIImage(systemName: "star"){
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
            sender.tintColor = .black
            
            var tempFav = FavArticle(context: moc)
            tempFav.title = myTitleNews.text!
            tempFav.content = myNewsContent.text!
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
           
        }else{
            sender.setImage(UIImage(systemName: "star"), for: .normal)
            sender.tintColor = .lightGray
        }
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTitleNews.text = newsContent.title
        
        if newsContent.urlToImage != nil
        {
            let url = URL(string: newsContent.urlToImage!)
            newImage.downloadImage(from: url!)
            newImage.contentMode = .scaleToFill
        }
        else
        {
            newImage.image = UIImage(named: "empty")
        }
        
        myNewsContent.text  = newsContent.content
        

        // Do any additional setup after loading the view.
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
