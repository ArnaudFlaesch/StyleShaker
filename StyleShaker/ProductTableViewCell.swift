import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if (selected){
            self.lblTitle.textColor = UIColor.whiteColor()
            self.lblId.textColor = UIColor.whiteColor()
            self.contentView.backgroundColor = UIColor.blackColor()
        }
    }
}