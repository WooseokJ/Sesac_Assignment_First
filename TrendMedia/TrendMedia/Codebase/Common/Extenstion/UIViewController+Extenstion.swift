
import Foundation
import UIKit
extension UIViewController {
    func documentDirectoryPath() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        print(documentDirectory)
        return documentDirectory
    }
    
    func showAlert(title: String, button: String = "ok") {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .default)
        alert.addAction(ok)
        present(alert,animated: true)
    }
    
}
