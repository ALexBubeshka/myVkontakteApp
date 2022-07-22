
import UIKit

extension GalleryViewController: UICollectionViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.destination is ViewController,
           let destination = segue.destination as? ViewController,
           let imageGallerySelectedIndexPath = sender as? Int

          {
            destination.imageGallerySelectedIndexPath = imageGallerySelectedIndexPath
            destination.imageGalleryFoto = fotoFriendsImages
            fotoFriendsImages = []
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print(indexPath.item)
//
//         let fullScreenView = UIView(frame: self.view.bounds)
//         let fullScreenImageView = UIImageView(frame: fullScreenView.frame)
//         fullScreenImageView.backgroundColor = .white
//         fullScreenImageView.contentMode = .scaleAspectFit
//         fullScreenView.addSubview(fullScreenImageView)
//         fullScreenImageView.image = UIImage(named: self.fotoAlbum[indexPath.item])
//         self.view.addSubview(fullScreenView)
//         self.navigationController?.isNavigationBarHidden = true
//         self.tabBarController?.tabBar.isHidden = true
//         let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
//         fullScreenView.addGestureRecognizer(tap)
    
//
//    @objc func onTap(_ recognizer: UITapGestureRecognizer) {
//
//        guard let targetView = recognizer.view else {return}
//
//        targetView.removeFromSuperview()
//
//    }
    let imageGallerySelectedIndexPath = indexPath.item
    
    
    performSegue(withIdentifier: fromGalleryViewController, sender: imageGallerySelectedIndexPath )
}
}
