import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack {
            Text("Amsterdam")
                .font(.largeTitle)
                .padding()
            Text("42ºC")
                .font(.system(size: 70))
                .bold()
            Text("☔️")
                .font(.largeTitle)
                .padding()
            Text("Raining Cats & Dogs")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
