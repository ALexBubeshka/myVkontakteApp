
import UIKit

@IBDesignable class LikeViewController: UIView {

    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var counterLabel: UILabel!
    
    var isPressed = false
    var counter = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromXIB() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeViewController", bundle: bundle)
        let xibView = xib.instantiate(withOwner: self).first as! UIView
        return xibView
        
    }
    
    private func setup() {
        let xibView = loadFromXIB()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
        counterLabel.text = String(counter)
    }
    
    @IBAction func pressLikeButton(_ sender: UIButton) {
        isPressed = !isPressed
        
        if isPressed {
            counter += 1
            heartImageView.image = UIImage(systemName: "heart.fill")
            
            let animate = CABasicAnimation.init(keyPath: "bounds.size")
            animate.autoreverses = true
            animate.toValue = CGSize(width: 20, height: 20)
            animate.duration = 0.5
            heartImageView.layer.add(animate, forKey: nil)
           
        } else {
            counter -= 1
           heartImageView.image = UIImage(systemName: "heart")

            let animate = CABasicAnimation.init(keyPath: "bounds.size")
            animate.autoreverses = true
            animate.toValue = CGSize(width: 20, height: 20)
            animate.duration = 0.5
            heartImageView.layer.add(animate, forKey: nil)
         
        }
        counterLabel.text = String(counter)
    }
}
