

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet var imagecircleCollection: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designImage(imagecircleCollection)
        
    }
    func designImage(_ imageCollection: [UIImageView]){
        for item in imageCollection{
            item.layer.cornerRadius = item.frame.width / 2
            item.clipsToBounds = true
            item.layer.borderWidth = 3
            item.layer.borderColor = UIColor.blue.cgColor
            item.clipsToBounds = true
        }
        
    }
    @IBAction func playRandomImage(_ sender: UIButton) {
        let movieTitle = UIImage(named: "movie\(Int.random(in: 1...8))")
        backgroundImageView.image = movieTitle
        
         
        
    }
    @IBAction func signupClicked(jack : UIStoryboardSegue) {
    
    }
    
   
    
    @IBAction func LoginButton(_ sender: UIButton) {
        if let signUpPage = self.storyboard?.instantiateViewController(withIdentifier: "SignUpView") as? SignUpViewController{
            present(signUpPage, animated: true, completion: nil)
        }
    
    }
    
}

