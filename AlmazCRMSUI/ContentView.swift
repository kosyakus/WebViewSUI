//
//  ContentView.swift
//  AlmazCRMSUI
//
//  Created by Natalia Sinitsyna on 01.02.2025.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        // WebView — это кастомная структура, которую мы создадим ниже
        WebView(url: URL(string: "https://habr.com")!)
//            .edgesIgnoringSafeArea(.all) // Чтобы WebView занял весь экран
    }
}

// WebView, построенный на UIViewRepresentable, чтобы встроить WKWebView в SwiftUI
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        // Создаём экземпляр WKWebView
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Загружаем сайт по URL
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    ContentView()
}
