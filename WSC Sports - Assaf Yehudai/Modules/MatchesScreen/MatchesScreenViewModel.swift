//
//  MatchesScreenViewModel.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation
import Combine

class MatchesScreenViewModel {
    // MARK: - Subscriptions
    private var subsciptions = Set<AnyCancellable>()
    
    // MARK: - Properties
    private weak var repo: AppRepository!
    private weak var appCoordinator: AppCoordinator?
    
    // MARK: - Publishers
    @Published var matches = [UIMatch]()
    
    // MARK: - Constructor
    init(repo: AppRepository, appCoordinator: AppCoordinator) {
        self.repo = repo
        self.appCoordinator = appCoordinator
        subscribeForUpdates()
    }
    
    // MARK: - Public
    func fetchData() {
        repo.fetchMatches()
    }
    
    func openStory(with matchId: String) {
        appCoordinator?.openStory(for: matchId)
    }
    
    // MARK: - Private Helpers
    func subscribeForUpdates() {
        repo.$matches
            .receive(on: DispatchQueue.main)
            .sink {[weak self] newMatches in
                self?.matches = MatchConverter.conver(matches: newMatches)
            }
            .store(in: &subsciptions)
    }
}
