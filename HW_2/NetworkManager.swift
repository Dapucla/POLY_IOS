//
//  NetworkManager.swift
//  HW_2
//
//  Created by Даниил Алексеев on 06.10.2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    static var authorsResults = [Results]()

    let baseURL = "https://itunes.apple.com/search?term="
    
    func getAuthor(for authorName: String, completed: @escaping (Author?, String?)-> Void ){
        let endpoint = baseURL + "\(authorName)"
        guard let url = URL(string: endpoint) else {
            completed(nil, "Недействительное имя автора")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error{
                completed(nil, "Не удалось установится связь с сервером")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Не удалось установится связь с сервером")
                return
            }
            
            guard let data = data else {
                completed(nil, "Не удалось установится связь с сервером")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let authors = try decoder.decode(Author.self, from: data)
                NetworkManager.authorsResults = authors.results
                completed(authors, nil)
                
            } catch {
                completed(nil, "Не удалось установится связь с сервером")
            }
        }
        task.resume()
    }
}
