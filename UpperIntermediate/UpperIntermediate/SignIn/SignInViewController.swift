
import UIKit

protocol SignInViewControllerDelegate: class {
    func showCredentialsError()
}

class SignInViewController: UIViewController, SignInViewControllerDelegate {
    let viewModel: SignInViewModelType
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    init(viewModel: SignInViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self

    }
    
    @IBAction func onSignIn(_ sender: UIButton) {
        viewModel.signInTapped()
    }
    
    func showCredentialsError() {
        let alert = UIAlertController(title: "Error", message: "Incorrect login or password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
//        alert.actions = [UIAlertAction()]
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == loginTextField {
            viewModel.loginFieldDidChange(with: textField.text ?? "")
        } else if textField == passwordTextField {
            viewModel.passwordDidChange(with: textField.text ?? "")
        }
    }
}
