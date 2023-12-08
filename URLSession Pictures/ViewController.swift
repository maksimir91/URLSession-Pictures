//
//  ViewController.swift
//  URLSession Pictures
//
//  Created by Stanislav Shut on 08.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func getImageButtonTapped(_ sender: Any) {
        // 1) получаем API
        let API = "https://loremflickr.com/400/800"
        // 2) создаем URL
        guard let apiURL = URL(string: API) else {
            fatalError("some error")
        }
        // 3) инициализируем сессию
        let session = URLSession(configuration: .default)
        // 4) создаем запрос dataTask
        let task = session.dataTask(with: apiURL) { (data, response, error) in
            // 5) обрабатываем полученные данные
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        // 6) запускаем запрос
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

