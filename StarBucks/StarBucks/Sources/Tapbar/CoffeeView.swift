import SwiftUI

struct CoffeeView: View {
    let coffee: Coffee
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Image(coffee.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Button(action: { dismiss() }) {
                    Image("backbutton")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding()
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(coffee.name)
                        .font(.PretendardBold24)
                    Image("new")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text(coffee.ename)
                    .font(.PretendardSemibold14)
                    .foregroundColor(.gray)
                Text(coffee.description)
                    .font(.PretendardSemibold14)
                    .padding(.top, 32)
                Text(coffee.price)
                    .font(.PretendardSemiBold24)
                    .padding(.top, 20)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoffeeView(coffee: NaviCoffeeModel.coffees[2])
        }
    }
}
