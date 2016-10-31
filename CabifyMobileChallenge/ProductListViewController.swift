class ProductListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: ProductListFooterView!
    
    lazy var accessory = ProductListViewControllerAccessory()
    
    var products: [ProductListModel] = []
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
        loadProducts()
    }
    
    // MARK: - Private methods
    
    fileprivate func setUp() {
        title = NSLocalizedString("PRODUCT_LIST_TITLE")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("PRODUCT_LIST_RELOAD_BUTTON"), style: .plain, target: self, action: #selector(reloadButtonTapped(_:)))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("PRODUCT_LIST_CLEAR_BUTTON"), style: .plain, target: self, action: #selector(clearButtonTapped(_:)))
    }
    
    fileprivate func loadProducts() {
        let hud = JGProgressHUD(style: .dark)
        hud?.show(in: view)
        
        let requestManager = GetProductsRequestManager()
        requestManager.makeRequest { (response) in
            let response = response as! GetProductsRequestManagerResponse
            
            hud?.dismiss()
            
            if response.statusCode == .ok {
                
                // Reload
                self.products = self.accessory.composeProductList(response.products)
                self.tableView.reloadData()
                
            } else {
                
                // Error alert
                self.presentAlert(NSLocalizedString("ALERT_ERROR_LOADING_PRODUCTS"))
            }
        }
    }
    
    // MARK: - Actions
    
    func reloadButtonTapped(_ sender: UIBarButtonItem) {
        products.removeAll()
        footerView.total = 0
        tableView.reloadData()
        loadProducts()
    }
    
    func clearButtonTapped(_ sender: UIBarButtonItem) {
        accessory.clearNumberOfItems(products)
        footerView.total = 0
        tableView.reloadData()
    }
}

extension ProductListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.nameOfClass) as! ProductTableViewCell
        cell.product = products[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProductListViewController: ProductTableViewCellDelegate {
    func didUpdateProduct(product: ProductListModel?) {
        footerView.total = accessory.calculateTotalPrice(products)
    }
}
