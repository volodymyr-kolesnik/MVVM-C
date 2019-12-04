import UIKit

final class HomeCoordinator: CoordinatorType {
    let navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = HomeViewController()
        
        navigationController.pushViewController(controller, animated: true)
    }
}
