//
//  UserView.swift
//  AsyncAwaitSwiftUI
//
//  Created by Harish Kshirsagar on 03/09/24.
//

import SwiftUI

struct UserView: View {
    
    @State var userName: String
    @State var id: Int
    @State var imageString: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageString)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.circle)
            } placeholder: {
                Circle()
                    .foregroundColor(.gray)
            }
            .frame(width: 200, height: 200)

            HStack {
                Text("Name")
                    .font(.title2)
                    .bold()
                Text("\(userName)")
                    .font(.title2)
            }
            HStack {
                Text("ID")
                    .font(.title2)
                    .bold()
                Text("\(id)")
                    .font(.title2)
            }
   
        }
    }
}

#Preview {
    UserView(userName: "Harish", id: 3, imageString: "")
}
