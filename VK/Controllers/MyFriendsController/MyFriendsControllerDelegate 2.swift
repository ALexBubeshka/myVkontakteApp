
import UIKit

extension MyFriendsController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       super.prepare(for: segue, sender: sender)
        
        if segue.identifier == fromFriendsListToGallery,
           let destinationController = segue.destination as? GalleryViewController,
           let fotos = sender as? [String] {
            
            destinationController.fotoAlbum = fotos
         
        }

    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let fotos = myFriends[indexPath.row].fotoAlbum
//        performSegue(withIdentifier: fromFriendsListToGallery, sender: fotos)
//       
//    }
    
}
