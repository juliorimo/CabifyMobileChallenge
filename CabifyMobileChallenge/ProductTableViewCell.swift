protocol ProductTableViewCellDelegate: class {
    func didUpdateProduct(product: ProductListModel?)
}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    weak var delegate: ProductTableViewCellDelegate?
    
    var product: ProductListModel? {
        didSet {
            if let product = product {
                updateNameLabel(product)
                priceLabel.text = String(format: NSLocalizedString("PRODUCT_LIST_CELL_UNIT_PRICE"), product.product.price)
                stepper.value = Double(product.numberOfItems ?? 0)
            }
        }
    }
    
    // MARK: - View
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.text = "-"
        priceLabel.text = String(format: NSLocalizedString("PRODUCT_LIST_CELL_UNIT_PRICE"), "?")
    }
    
    func updateNameLabel(_ product: ProductListModel?) {
        if let product = product {
            nameLabel.text = String(format: NSLocalizedString("PRODUCT_LIST_CELL_NAME"), product.product.name, product.numberOfItems)
        } else {
            nameLabel.text = "-"
        }
    }
    
    // MARK: - Actions
    
    @IBAction func stepperAction(sender: UIStepper) {
        product?.numberOfItems = NSNumber(value: sender.value)
        updateNameLabel(product)
        delegate?.didUpdateProduct(product: product)
    }
}
