import UIKit


final class SignInCoordinator: CoordinatorType {
    let navigationController: UINavigationController

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("SignInCoordinator deinit")
    }
    
    func start() {
        let viewModel = SignInViewModel()
        let viewController = SignInViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        
        viewModel.onSuccessedLogin = { self.loggedIn() }
        
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func loggedIn() {
        HomeCoordinator(with: navigationController).start()
    }
}
