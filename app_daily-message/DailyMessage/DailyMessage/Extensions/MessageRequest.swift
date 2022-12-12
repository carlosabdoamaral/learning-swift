//
//  MessageRequest.swift
//  DailyMessage
//
//  Created by Carlos Amaral on 17/01/22.
//

import Foundation

class Network : ObservableObject {
    @Published var Messages : [MessageModel] = []
    
    func getMessages() {
        guard let url = URL(string: "http://localhost:8080/message") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedMessages = try JSONDecoder().decode([MessageModel].self, from: data)
                        self.Messages = decodedMessages
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }

}
