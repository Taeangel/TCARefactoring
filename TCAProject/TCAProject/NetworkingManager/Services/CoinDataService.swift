//
//  CoinDataService.swift
//  TCAProject
//
//  Created by song on 2022/12/03.
//

import Foundation
import Combine

protocol coinServiceProtocol {
  func getCoins()
}

class CoinDataService {
  @Published var allCoins: [CoinModel] = []
  private var coinSubscription: AnyCancellable?
  
  init() {
    getCoins()
  }
}

extension CoinDataService: coinServiceProtocol {
  func getCoins() {
    guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
    
    coinSubscription = NetworkingManager.download(url: url)
      .decode(type: [CoinModel].self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
        self?.allCoins = returnedCoins
        self?.coinSubscription?.cancel()
      })
  }
}
