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
    
    override func viewDidLoad() {
        codedCell.textLabel?.font = UIFont.systemFont(ofSize: 12)
    }

}
