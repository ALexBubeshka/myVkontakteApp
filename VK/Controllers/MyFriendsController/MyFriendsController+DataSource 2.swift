
import UIKit

extension MyFriendsController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewReuseIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        
        let friend = myFriends[indexPath.row]
        cell.configureOne (image: UIImage(named: friend.avatar!), name: friend.name, discriprion: friend.age, closure: { [weak self] in
            guard let self = self else {return}
            let fotos = self.myFriends[indexPath.row].fotoAlbum
            self.performSegue(withIdentifier: self.fromFriendsListToGallery, sender: fotos)
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }
}


