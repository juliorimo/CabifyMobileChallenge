class ProductListFooterView: UIView {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var total: Double = 0 {
        didSet {
            amountLabel.text = "\(NSNumber(value: total))"
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        totalLabel.text = NSLocalizedString("PRODUCT_FOOTER_TOTAL_TEXT")
        total = 0
    }
}
