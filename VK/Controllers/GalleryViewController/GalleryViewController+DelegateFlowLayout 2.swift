
import UIKit

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let whiteSpeces:CGFloat = 20
        let cellWidth =  width / 3 - whiteSpeces
        
      return  CGSize (width: cellWidth, height: cellWidth + 20)

    }
}
