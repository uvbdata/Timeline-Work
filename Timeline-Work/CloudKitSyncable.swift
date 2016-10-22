//
//  CloudKitSyncable.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 21/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import Foundation
import CloudKit

protocol CloudKitSyncable: class {
    init?(record: CKRecord)
    
    var cloudKitRecordID: CKRecordID? { get set }
    var recordType: String { get }
    
    
}

extension CloudKitSyncable {
    var isSynced: Bool {
        if let _ = cloudKitRecordID {
            return true
        } else {
            return false
        }
    }

    var cloudKitReference: CKReference? {
        guard let recordId = cloudKitRecordID else { return nil }
        let recordReference: CKReference? = CKReference(recordID: recordId, action: .none)
        return recordReference ?? nil
    }
    
}
