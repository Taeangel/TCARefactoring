//
//  AppMain.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import SwiftUI
import LinkNavigator

@main
struct AppMain: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

  var navigator: LinkNavigator {
    appDelegate.navigator
  }

  var body: some Scene {
    WindowGroup {
      navigator
        .launch(paths: ["home"], items: [:])
    }
  }
}

