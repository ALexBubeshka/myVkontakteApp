
import UIKit

class MyGroupViewController: UIViewController {

    var groups = [Group]()
    
    let customTableViewCellReuse = "customTableViewCellReuse"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
        tableView.dataSource = self
        tableView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(didPressToGroup(_:)), name:  Notification.Name("pressToGroup"), object: nil)
    }
   
    @objc func didPressToGroup(_ notification:Notification){
        
        guard let group = notification.object as? Group else { return }
        
        if !groups.contains(where: { groupItem in
            groupItem.name == group.name
        }) {
            groups.append(group)
            tableView.reloadData()
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}





