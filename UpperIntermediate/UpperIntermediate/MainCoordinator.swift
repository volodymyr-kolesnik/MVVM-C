import UIKit

protocol CoordinatorType: class {
    init(with navigationController: UINavigationController)
}

protocol InitialCoordinator: class {
    init(with window: UIWindow?)
    func start()
}


final class MainCoordinator: InitialCoordinator {
    var window: UIWindow?
    
    init(with window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        guard let window = window else { return }
        let navigationController = UINavigationController()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        SignInCoordinator(with: navigationController).start()
    }
}
