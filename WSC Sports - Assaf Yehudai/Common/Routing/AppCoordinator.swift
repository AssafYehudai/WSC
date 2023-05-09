//
//  AppCoordinator.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation
import UIKit

class AppCoordinator {
    
    var navigationController: UINavigationController
    var repo: AppRepository!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        repo = AppRepository()
    }
    
    func start() {
        let vc = MatchesScreen(viewModel: MatchesScreenViewModel(repo: repo))
        navigationController.show(vc, sender: nil)
    }
}
