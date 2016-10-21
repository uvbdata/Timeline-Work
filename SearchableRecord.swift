//
//  SearchableRecord.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 20/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matchesSearchTerm(searchTerm: String) -> Bool
}
