extension UIViewController {
    func presentAlert(_ message: String?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
}
