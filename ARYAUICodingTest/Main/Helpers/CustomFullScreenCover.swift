//
//  CustomFullScreenCover.swift
//  ARYAUICodingTest
//
//  Created by Tsz-Lung on 17/03/2025.
//

import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }
}

final class SceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.isHidden = true
        window?.isUserInteractionEnabled = false
    }
    
    func showFullScreen<Content: View>(@ViewBuilder content: @escaping () -> Content) {
        guard let window, window.rootViewController == nil else { return }
        
        let hostingVC = UIHostingController(rootView: content())
        hostingVC.view.backgroundColor = .clear
        
        window.rootViewController = hostingVC
        window.isHidden = false
        window.isUserInteractionEnabled = true
    }
    
    func hideFullScreen() {
        guard let window else { return }
        
        window.rootViewController = nil
        window.isHidden = true
        window.isUserInteractionEnabled = false
    }
}

extension View {
    func customFullScreenCover<Content: View>(isPresented: Binding<Bool>,
                                              @ViewBuilder content: @escaping () -> Content) -> some View {
        modifier(FullScreenCover(isPresented: isPresented, fullScreenContent: content))
    }
}

private struct FullScreenCover<FullScreenContent: View>: ViewModifier {
    @EnvironmentObject private var sceneDelegate: SceneDelegate
    
    @Binding var isPresented: Bool
    @ViewBuilder let fullScreenContent: () -> FullScreenContent
    
    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { newValue in
                if newValue {
                    sceneDelegate.showFullScreen(content: fullScreenContent)
                } else {
                    DispatchQueue.main.async { sceneDelegate.hideFullScreen() }
                }
            }
    }
}
