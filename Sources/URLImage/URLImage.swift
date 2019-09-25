//
//  URLImage.swift
//
//  Created by Patrik Svoboda on 30/08/2019.
//  Copyright © 2019 Patrik Svoboda. All rights reserved.
//

import SwiftUI
import ImageIOSwift
import ImageIOSwiftUI

public struct URLImage: View {
    // MARK: Properties
    private var urlString: String
    private var url: URL
    private var defaultURL: String = "https://google.com"
    // MARK: Functions
    public init(_ urlString: String) {
        self.urlString = urlString
        self.url = URL(string: self.defaultURL)!
        self.url = self.guardURL(urlString)
    }
    private func guardURL(_ string: String) -> URL! {
        guard let url = URL(string: string) else {
            return URL(string: self.defaultURL)!
        }
        return url
    }
    // MARK: - Body
    public var body: some View {
        ZStack {
            // MARK: Placeholder
            Image("placeholder")
                .resizable()
                .renderingMode(.original)
            // MARK: The image
            URLImageSourceView(url)
                .aspectRatio(contentMode: .fill)
        }
    }
}
