// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import UIKit

extension UIColor {
  fileprivate convenience init(hex: UInt32) {
    let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
    let b = CGFloat(hex & 0x0000FF) / 255.0
    self.init(displayP3Red: r, green: g, blue: b, alpha: 1.0)
  }
}

public class Colors {
  public static let grey000 = UIColor(hex: 0x1E2029)
  public static let grey100 = UIColor(hex: 0x3B3E4F)
  public static let grey200 = UIColor(hex: 0x5E6175)
  public static let grey300 = UIColor(hex: 0x84889C)
  public static let grey400 = UIColor(hex: 0xAEB1C2)
  public static let grey600 = UIColor(hex: 0xCED0DB)
  public static let grey900 = UIColor(hex: 0xF0F2FF)
  public static let neutral200 = UIColor(hex: 0x495057)
  public static let neutral600 = UIColor(hex: 0xDEE2E6)
  public static let neutral800 = UIColor(hex: 0xF1F3F5)
  public static let neutral900 = UIColor(hex: 0xF8F9Fa)
  public static let blue500 = UIColor(hex: 0x5DB5FC)
  public static let blurple000 = UIColor(hex: 0x0B0E38)
  public static let blurple400 = UIColor(hex: 0x4C54D2)
  public static let blurple500 = UIColor(hex: 0x737ADE)
  public static let blurple600 = UIColor(hex: 0xA0A5EB)
  public static let blurple700 = UIColor(hex: 0xD0D2F7)
  public static let blurple800 = UIColor(hex: 0xF0F1FF)
  public static let magenta300 = UIColor(hex: 0xA3278F)
  public static let purple300 = UIColor(hex: 0x6845D1)
  public static let purple400 = UIColor(hex: 0x845EF7)
  public static let orange400 = UIColor(hex: 0xFB542B)
  public static let orange500 = UIColor(hex: 0xFF7654)
  public static let red300 = UIColor(hex: 0xBD1531)
}
