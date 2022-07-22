
import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.fotoAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCell, for: indexPath) as! CustomCollectionViewCell
        
        fotoFriendsImages.append(UIImage(named: fotoAlbum[indexPath.item])!)
        cell.configure(image: UIImage(named: self.fotoAlbum[indexPath.item]))
        
        return cell
        
    }
}

