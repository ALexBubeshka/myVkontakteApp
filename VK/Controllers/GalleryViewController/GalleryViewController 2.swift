import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let customCollectionViewCell = "CustomCollectionViewCellReuseIdentifier"
    let fromGalleryViewController = "fromGalleryViewController"
   
    var fotoAlbum = [String]()
    var fotoFriendsImages = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: customCollectionViewCell)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
        
    }
    
    
    
}
