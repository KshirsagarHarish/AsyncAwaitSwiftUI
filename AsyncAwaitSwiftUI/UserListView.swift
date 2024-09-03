//
//  ContentView.swift
//  AsyncAwaitSwiftUI
//
//  Created by Harish Kshirsagar on 03/09/24.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: ProductViewModel = ProductViewModel()

    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.users, id: \.id) { user in
                    HStack {
                        AsyncImage(url: URL(string: user.avatarURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.circle)
                        } placeholder: {
                            Circle()
                                .foregroundColor(.gray)
                        }
                        .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("\(user.login.capitalized)")
                                .font(.headline)
                            Text("\(user.avatarURL)")
                        }
                        NavigationLink(destination: UserView(userName: user.login, id: user.id, imageString: user.avatarURL)) {}
                    }
                }
                .navigationTitle("Users")
            }
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(CGSize(width: 2, height: 2))
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            }
        }
        .task {
            await viewModel.getProducts()
        }
        .alert(isPresented: $viewModel.shouldShowError, content: {
            return Alert(title: Text("Error"), message: Text("\(viewModel.errorMessage)"))
        })
    }
}

#Preview {  
    UserListView()
}
