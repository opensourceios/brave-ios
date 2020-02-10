// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import UIKit
import Shared
import BraveShared
import BraveUI

class AdvancedShieldsView: UIStackView, Themeable {
    
    var themeableChildren: [Themeable?]?
    
    let siteTitle = HeaderTitleView()
    let adsTrackersControl = ToggleView(title: Strings.blockAdsAndTracking)
    let httpsUpgradesControl = ToggleView(title: Strings.HTTPSEverywhere)
    let blockMalwareControl = ToggleView(title: Strings.blockPhishing)
    let blockScriptsControl = ToggleView(title: Strings.blockScripts)
    let fingerprintingControl = ToggleView(title: Strings.fingerprintingProtectionWrapped)
    let globalControlsTitleView = HeaderTitleView().then {
        $0.titleLabel.text = Strings.braveShieldsGlobalControls.uppercased()
    }
    
    private func dividerView() -> UIView {
        let divider = UIView()
        divider.backgroundColor = BraveUX.colorForSidebarLineSeparators
        divider.snp.makeConstraints { $0.height.equalTo(1.0 / UIScreen.main.scale) }
        return divider
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        
        let rows = [
            siteTitle,
            adsTrackersControl,
            httpsUpgradesControl,
            blockMalwareControl,
            blockScriptsControl,
            fingerprintingControl,
            globalControlsTitleView
        ]
        let separators = (0..<rows.count).map { _ in SeparatorView() }
        let n = zip(rows, separators)
        for (sep, row) in n {
            addArrangedSubview(sep)
            addArrangedSubview(row)
        }
        
        themeableChildren = separators
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension AdvancedShieldsView {
    
    class HeaderTitleView: UIView {
        
        let titleLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 13.0)
            $0.numberOfLines = 0
            $0.textColor = Colors.grey200
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(titleLabel)
            titleLabel.snp.makeConstraints {
                $0.top.leading.trailing.equalTo(self).inset(16)
                $0.bottom.equalTo(self).inset(6)
            }
        }
        
        @available(*, unavailable)
        required init(coder: NSCoder) {
            fatalError()
        }
    }
    
    /// A container displaying a toggle for the user
    class ToggleView: UIView {
        
        let titleLabel: UILabel = {
            let l = UILabel()
            l.font = .systemFont(ofSize: 15.0)
            l.numberOfLines = 0
            return l
        }()
        
        let toggleSwitch = UISwitch()
        var valueToggled: ((Bool) -> Void)?
        
        init(title: String) {
            super.init(frame: .zero)
            
            let stackView = UIStackView()
            stackView.spacing = 12.0
            stackView.alignment = .center
            addSubview(stackView)
            self.snp.makeConstraints {
                $0.height.greaterThanOrEqualTo(44)
            }
            stackView.snp.makeConstraints {
                $0.leading.trailing.equalTo(self).inset(16)
                $0.top.bottom.equalTo(self)
            }
            
            stackView.addArrangedSubview(titleLabel)
            stackView.addArrangedSubview(toggleSwitch)
            
            titleLabel.text = title
            toggleSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
            
            toggleSwitch.setContentHuggingPriority(.required, for: .horizontal)
//            titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
            
            snp.makeConstraints {
                $0.height.greaterThanOrEqualTo(toggleSwitch)
            }
        }
        
        @available(*, unavailable)
        required init?(coder aDecoder: NSCoder) {
            fatalError()
        }
        
        @objc private func switchValueChanged() {
            valueToggled?(toggleSwitch.isOn)
        }
    }
    
    class SeparatorView: UIView, Themeable {
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.snp.makeConstraints {
                $0.height.equalTo(1.0 / UIScreen.main.scale)
            }
        }
        
        @available(*, unavailable)
        required init(coder: NSCoder) {
            fatalError()
        }
        
        func applyTheme(_ theme: Theme) {
            backgroundColor = theme.isDark ?
                UIColor(white: 1.0, alpha: 0.2) :
                UIColor(white: 0.0, alpha: 0.2)
        }
    }
}
