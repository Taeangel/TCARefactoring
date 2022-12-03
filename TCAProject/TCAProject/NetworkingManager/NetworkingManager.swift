//
//  NetworkingManager.swift
//  TCAProject
//
//  Created by song on 2022/12/03.
//

import Foundation
import Combine

struct NetworkingManager {
  
  enum NetworkingError: LocalizedError {
    case badURLResponse(url: URL)
    case unknown
    
    var errorDescription: String? {
      switch self {
      case let .badURLResponse(url):
        print("badURLResponseError \(url)")
        return "badURLResponseError \(url)"
      case .unknown:
        print("unknownError")
        return "unknownError"
      }
    }
  }
  
  static func download(url: URL) -> AnyPublisher<Data, Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
      .tryMap({ try handleResponse(output: $0, url: url) })
      .retry(3)
      .eraseToAnyPublisher()
  }
  
  static func handleResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
    guard let response = output.response as? HTTPURLResponse,
          response.statusCode >= 200 && response.statusCode < 300 else {
      throw NetworkingError.badURLResponse(url: url)
    }
    return output.data
  }
  
  static func handleCompletion(completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      break
    case .failure(let error):
      print("\(error)")
      print(error.localizedDescription)
      
    }
  }
}
