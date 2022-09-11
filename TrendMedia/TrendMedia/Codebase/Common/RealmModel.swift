//
//  RealmModel.swift
//  TrendMedia
//
//  Created by useok on 2022/08/22.
//

import Foundation
import RealmSwift
import UIKit

class PurchaseInfo: Object {
    @Persisted var titleName: String // 구매항목
    @Persisted var checkBox: Bool
    @Persisted var checkStar: Bool
    @Persisted var imageString: String?
    @Persisted(primaryKey: true) var objectId: ObjectId
    convenience init(titleName: String) {
        self.init()
        self.titleName = titleName
        self.checkBox = false
        self.checkStar = false
        self.imageString = nil
        
    }
    
}
