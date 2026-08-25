//: [Previous](@previous)

import Foundation
import Combine

//MARK: - PassthroughSubject
struct Weather {
    let passtrough = PassthroughSubject<Int, Error>()
    
    func getWeatherInfo(){
        passtrough.send(30)
        passtrough.send(completion: .failure(URLError(.badURL)))
        passtrough.send(completion: .finished)
        passtrough.send(32)
    }
}

let weather = Weather()
weather.passtrough.sink { completion in
    switch completion {
    case .finished:
        print("Finished")
    case .failure(let error):
        print("error: \(error.localizedDescription)")
    }
} receiveValue: { value in
    print("received Value: \(value)")
}

weather.getWeatherInfo()

//MARK: - CurrentValueSubject


struct ChatBot {
    let publisher = CurrentValueSubject<String, Error>("first message default")
    
    func startOnBoarding(){
        publisher.send("second message")
    }
}

let bot = ChatBot()
bot.publisher.sink { completion in
    switch completion {
    case .finished:
        print("Finished")
    case .failure(let error):
        print("error: \(error.localizedDescription)")
    }
} receiveValue: { value in
    print("received Value: \(value)")
}
bot.startOnBoarding()
