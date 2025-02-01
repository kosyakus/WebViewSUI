//
//  ContentView.swift
//  AlmazCRMSUI
//
//  Created by Natalia Sinitsyna on 01.02.2025.
//

import SwiftUI
import WebKit

struct ContentView: View {
    // Переменная состояния для переключения экрана
    @State private var showWebView = false

    var body: some View {
        VStack {
            if showWebView {
                // Если showWebView == true, показываем экран с WebView
                WebViewScreen()
                    .transition(.opacity) // Анимация перехода
            } else {
                // Если showWebView == false, показываем экран с логотипом
                LogoScreen(showWebView: $showWebView)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: showWebView)
    }
}

/// Экран с логотипом. При нажатии на логотип переключаемся на WebView.
struct LogoScreen: View {
    @Binding var showWebView: Bool  // Используем @Binding, чтобы изменить состояние в ContentView
    
    var body: some View {
        // Просто для примера — логотип по центру экрана.
        VStack {
            Spacer()
            
            Image("almaz")
                .resizable()
                .scaledToFit()
                .frame(width: 200)  // Ширина/высота подбирается по вкусу
                .onTapGesture {
                    // По нажатию показываем WebView
                    showWebView = true
                }
            
            Spacer()
            
            Text("Нажмите на логотип, чтобы открыть сайт")
                .font(.headline)
        }
        .padding()
    }
}

/// Экран с WebView, где открывается ваш сайт
struct WebViewScreen: View {
    var body: some View {
        WebView(url: URL(string: "https://crm.wtvr.ru/")!)
            .edgesIgnoringSafeArea(.all)
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
