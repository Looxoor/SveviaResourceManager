//
//  LocalizeStrings.swift
//  SveviaResourceManager
//
//  Created by Björn Holmér on 2018-10-10.
//  Copyright © 2018 Seizemore Consulting. All rights reserved.
//

import UIKit
///A neat way to handle localization of different UIItems
public class LocalizeStrings {
    
    func setLabelText(_ uiItem: inout UILabel, localizableDescriptor: String, comment: String) {
        let uiText = NSLocalizedString(localizableDescriptor, comment: comment)
        uiItem.text = String.localizedStringWithFormat(uiText)
    }
    
    func setTextFieldPlaceholder(_ uiItem: inout UITextField, localizableDescriptor: String, comment: String) {
        let uiText = NSLocalizedString(localizableDescriptor, comment: comment)
        uiItem.placeholder = String.localizedStringWithFormat(uiText)
    }
    
    func setTextFieldText(_ uiItem: inout UITextField, localizableDescriptor: String, comment: String) {
        let uiText = NSLocalizedString(localizableDescriptor, comment: comment)
        uiItem.text = String.localizedStringWithFormat(uiText)
    }

    func setNavigationBarTitle(_ uiItem: inout UINavigationItem, localizableDescriptor: String, comment: String) {
        let uiText = NSLocalizedString(localizableDescriptor, comment: comment)
        uiItem.title = String.localizedStringWithFormat(uiText)
    }
    
    func setNavigationBarPrompt(_ uiItem: inout UINavigationItem, localizableDescriptor: String, comment: String) {
        let uiText = NSLocalizedString(localizableDescriptor, comment: comment)
        uiItem.prompt = String.localizedStringWithFormat(uiText)
    }
    
    func setNavigationBarButtonTitle(_ uiItem: inout UIBarButtonItem, localizableDescriptor: String, comment: String) {
        let uiText = NSLocalizedString(localizableDescriptor, comment: comment)
        uiItem.title = String.localizedStringWithFormat(uiText)
    }
    
    func setButtonTitle(_ uiItem: inout UIButton, localizableDescriptor: String, comment: String) {
        let uiText = NSLocalizedString(localizableDescriptor, comment: comment)
        uiItem.setTitle(String.localizedStringWithFormat(uiText), for: .normal)
    }
    
}
