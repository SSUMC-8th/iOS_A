import SwiftUI

//public struct ContentView: View {
//    public init() {}
//
//    public var body: some View {
//        Text("Hello, World!")
//            .padding()
//    }
//}

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, Tuist!")
            .font(.custom("Pretendard-Black", size: 24)) // ✅ 폰트 이름 주의!
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

