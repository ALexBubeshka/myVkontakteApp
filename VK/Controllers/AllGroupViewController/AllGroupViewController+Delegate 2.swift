
import UIKit

extension AllGroupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let group = groups[indexPath.item]
        NotificationCenter.default.post(name: Notification.Name("pressToGroup"), object: group)
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
