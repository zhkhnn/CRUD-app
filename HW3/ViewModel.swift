//
//  ViewModel.swift
//  HW3
//
//  Created by Aruzhan Zhakhan on 05.04.2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var items = [PostModel]()
    let preficURL = "http://localhost:3000"
    
    init(){
        fetchPosts()
    }
    func fetchPosts(){
        guard let url = URL(string: "\(preficURL)/posts") else{
            print("Not found URL")
            return
        }
        URLSession.shared.dataTask(with: url){ (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                }
                else{
                    print("no data")
                }
            } catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
    func createPost(parameters: [String: Any]){
        guard let url = URL(string: "\(preficURL)/createPost") else{
            print("Not found URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }
                else{
                    print("no data")
                }
            } catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
    func updatePost(parameters: [String: Any]){
        guard let url = URL(string: "\(preficURL)/updatePost") else{
            print("Not found URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }
                else{
                    print("no data")
                }
            } catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
    func deletePost(parameters: [String: Any]){
        guard let url = URL(string: "\(preficURL)/deletePost") else{
            print("Not found URL")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                }
                else{
                    print("no data")
                }
            } catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
}
