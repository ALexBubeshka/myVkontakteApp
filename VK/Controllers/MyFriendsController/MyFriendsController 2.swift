
import UIKit

class MyFriendsController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let fromFriendsListToGallery = "fromFriendsListToGallery"
    
    let CustomTableViewReuseIdentifier = "CustomTableViewReuseIdentifier"
    
    func fillData() -> [Friend] {
        let friend1 = Friend (name: "Вадим", age: "31", avatar: "Вадим", fotoAlbum:["Вадим","Вадим1"])
        let friend2 = Friend (name: "Алена", age: "30", avatar: "Алена3", fotoAlbum:["Алена1","Алена2","Алена","Алена4","Алена5","Алена6","Алена7"])
        let friend3 = Friend (name: "Егор", age: "32", avatar: "Вадим2", fotoAlbum:["Вадим2"])
        let friend4 = Friend (name: "Armin", age: "28", avatar: "armin", fotoAlbum:["armin1","armin2","armin3"])
      
        var friendsArray = [Friend]()
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray.append(friend4)
        return friendsArray
    }
    
    var sourceFriends = [Friend]()
    var myFriends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self

        myFriends = fillData()
        sourceFriends = myFriends
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: CustomTableViewReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        
    }
    // удаление строки
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myFriends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
extension MyFriendsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText .isEmpty {
            myFriends = sourceFriends
        } else {
            myFriends = sourceFriends.filter({ friendItem in
                friendItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}

