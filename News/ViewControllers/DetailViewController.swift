//
//  DetailViewController.swift
//  News
//
//  Created by Nataly on 02.07.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var new: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImage()
        // Do any additional setup after loading the view.
    }
    
    private func fetchImage() {
            // создаем экземпляр класса юрл
        guard let string = new.urlToImage else { return }
        guard let url = URL(string: string) else { return }
            
         
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, let response = response else {
                    print(error?.localizedDescription ?? "No error description")
                    return
                }
               
                guard let image = UIImage(data: data) else { return }
                
                
                //запрос происходит в фоновом потоке
                //а интерфейс работает в основном потоке
                //нужно выйти из фонового в основной поток
                DispatchQueue.main.async {
                    //передаем картинку
                    self.imageView.image = image
                    // останавливаем ромашку
                    //self.activityIndicator.stopAnimating()
                }
            }.resume()
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
