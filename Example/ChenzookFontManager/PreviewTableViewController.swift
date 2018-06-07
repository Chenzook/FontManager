//  Created by Seyed Mojtaba Hosseini Zeidabadi.
//  Copyright © 2018 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//
//  License: MIT License
//

import UIKit

class PreviewTableViewController: UITableViewController {

    @IBOutlet weak var codedCell: UITableViewCell!

    @IBAction func showAlertButtonDidTouch(_ sender: UIButton) {
        showAlert(style: .alert)
    }
    
    @IBAction func showActionSheetButtonDidTouch(_ sender: UIButton) {
        showAlert(style: .actionSheet)
    }
    
    override func viewDidLoad() {
        codedCell.textLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    private func showAlert(style: UIAlertControllerStyle) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        let defaultAction = UIAlertAction(title: "Default", style: .default, handler: nil)
        let destructiveAction = UIAlertAction(title: "Destructive", style: .destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
