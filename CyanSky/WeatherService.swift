import Foundation
import CoreLocation

public final class WeatherService: NSObject {
    
    private let locationManger = CLLocationManager()
    private let OPENWEATHER_APIKEY = "2110c5dbe3f236eaab3ae14a09f1eeee"
    private var completionHandler: (()-> Void)?
    
}

struct APIResponse {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}

