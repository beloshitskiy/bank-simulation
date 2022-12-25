//
//  AvenirFontModifier.swift
//  BankSimulation
//
//  Created by Denis Beloshitskiy on 12/26/22.
//

import SwiftUI

enum AvenirFontType: String {
  case bold = "Avenir-Bold"
  case italic = "Avenir-Italic"
  case regular = "Avenit"
}

struct AvenirFont: ViewModifier {
  var type: AvenirFontType
  var size: CGFloat

  init(_ type: AvenirFontType = .regular, size: CGFloat = 16) {
    self.type = type
    self.size = size
  }

  func body(content: Content) -> some View {
    content.font(Font.custom(type.rawValue, size: size))
  }
}
