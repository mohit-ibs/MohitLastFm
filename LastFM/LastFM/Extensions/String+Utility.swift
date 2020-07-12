//
//  String+Utility.swift
//  LastFM
//
//  Created by Mohit Gupta on 12/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

extension String {    
    func addPercentEncodingInWhiteSpace() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}
