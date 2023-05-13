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
        navigationController.isNavigationBarHidden = true
        repo = AppRepository(matchesProvider: MatchesJSONProvider())
    }
    
    func start() {
        let viewModel = MatchesScreenViewModel(repo: repo, appCoordinator: self)
        let vc = MatchesScreen(viewModel: viewModel)
        navigationController.show(vc, sender: nil)
    }
    
    func openStory(for matchId: String) {
        DispatchQueue.main.async { [weak self] in
            let vc = StoryScreen()
            vc.modalPresentationStyle = .overFullScreen
            self?.navigationController.present(vc, animated: true)
        }
    }
}
