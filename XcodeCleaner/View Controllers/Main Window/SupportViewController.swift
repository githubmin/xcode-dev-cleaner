//
//  SupportViewController.swift
//  XcodeCleaner
//
//  Created by Konrad Kołakowski on 19.05.2018.
//  Copyright © 2018 One Minute Games. All rights reserved.
//
//  XcodeCleaner is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 3 of the License, or
//  (at your option) any later version.
//
//  XcodeCleaner is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with XcodeCleaner.  If not, see <http://www.gnu.org/licenses/>.

import Cocoa

internal final class SupportViewController: NSViewController {
    // MARK: Properties & outlets
    @IBOutlet weak var xcodeCleanerBenefitsTextField: NSTextField!
    
    // MARK: Initialization & overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // update benefits label
        self.xcodeCleanerBenefitsTextField.attributedStringValue = self.benefitsAttributedString(totalBytesCleaned: Preferences.shared.totalBytesCleaned)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        self.view.window?.styleMask.remove(.resizable)
    }
    
    // MARK: Helpers
    private func benefitsAttributedString(totalBytesCleaned: Int64) -> NSAttributedString {
        let totalBytesString = ByteCountFormatter.string(fromByteCount: totalBytesCleaned, countStyle: .file)
        
        let fontSize: CGFloat = 13.0
        let result = NSMutableAttributedString()
        
        let partOne = NSAttributedString(string: "You saved total of ",
                                           attributes: [.font : NSFont.systemFont(ofSize: fontSize)])
        result.append(partOne)
        
        let partTwo = NSAttributedString(string: "\(totalBytesString)",
                                            attributes: [.font : NSFont.boldSystemFont(ofSize: fontSize)])
        result.append(partTwo)
        
        let partThree = NSAttributedString(string: " thanks to XcodeCleaner!",
                                           attributes: [.font : NSFont.systemFont(ofSize: fontSize)])
        result.append(partThree)
        
        return result
    }
}