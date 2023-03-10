//
//  NetworkView.swift
//  SwiftUIDemo
//
//  Created by Ludovic Ollagnier on 10/03/2023.
//

import SwiftUI

struct NetworkView: View {

    @State private var downloadedImage: Image?
    @State private var ongoingRequest = false

    var body: some View {
        VStack {
            if let downloadedImage {
                downloadedImage
                    .resizable()
                    .frame(width: 100, height: 100)
            } else if ongoingRequest {
                ProgressView()
            }
            Button("Network Request") {
                Task {
                    ongoingRequest = true
                    if let image = await doNetworkRequest() {
                        downloadedImage = Image(uiImage: image)
                    }
                    ongoingRequest = false
                }
                print("Toto")
            }
            Button("Freeze") {
                Task {
                    await doBackground()
                }

                let serial = DispatchQueue(label: "serialQueue")
                serial.async {

                }
                serial.async {

                }
                DispatchQueue.global(qos: .userInteractive).async {
                    for i in 0...1000000 {
                        print(i)
                    }
                }
            }
        }
    }

    private func doBackground() async {
        await Task(priority: .medium) {
            for i in 0...1000000 {
                print(i)
            }
        }
    }

    private func doNetworkRequest() async -> UIImage? {
        guard let url = URL(string: "https://www.apple.com/v/iphone-14/e/images/key-features/features/size/size_yellow__dnv9794q7loy_large_2x.jpg") else { return nil }

//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"

        let session = URLSession.shared
//        let task = session.dataTask(with: url) { data, response, error in
//            //
//        }
//
//        task.resume()

        if let (data, response) = try? await session.data(from: url) {
            print(data)
            print(response)
            return UIImage(data: data)
        }

        return nil
    }
}

struct NetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkView()
    }
}
