//
//  ProductViewModel.swift
//  AsyncAwaitSwiftUI
//
//  Created by Harish Kshirsagar on 03/09/24.
//

import Foundation

@MainActor
final class ProductViewModel: ObservableObject {
    
    @Published var users: [Users] = []
    @Published var isLoading: Bool = false
    @Published var shouldShowError = false
    @Published var errorMessage = ""
    
    func getProducts() async {
        self.isLoading = true
        do {
            self.users = try await Networking.getProducts()
            self.isLoading = false
        } catch(let error) {
            self.isLoading = false
            self.shouldShowError = true
            self.errorMessage = error.localizedDescription
        }
    }
}
