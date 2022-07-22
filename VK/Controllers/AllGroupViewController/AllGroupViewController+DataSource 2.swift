
import UIKit

extension AllGroupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuse, for: indexPath) as! CustomTableViewCell
        
        let group = groups[indexPath.row]
        cell.configure(image: UIImage(named: group.avatar), name: group.name, discriprion: group.description)
        return cell
        
    }
}

