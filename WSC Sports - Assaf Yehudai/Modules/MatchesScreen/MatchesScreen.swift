//
//  MatchesScreen.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import UIKit
import Combine

class MatchesScreen: UIViewController {
    // MARK: - Subscriptions
    private var subsciptions = Set<AnyCancellable>()
    
    // MARK: - Properties
    private var viewModel: MatchesScreenViewModel?
    
    // MARK: - IBOutlets
    @IBOutlet weak var matchesTable: MatchesTableView!
    
    // MARK: - Constructor
    init(viewModel: MatchesScreenViewModel) {
        super.init(nibName: "MatchesScreen", bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel?.fetchData()
    }
    
    // MARK: - Private Helpers
    func bindViewModel() {
        viewModel?.$matches
            .receive(on: DispatchQueue.main)
            .sink { [weak self] matches in
                self?.matchesTable.updateTable(with: matches)
            }.store(in: &subsciptions)
        
        matchesTable.onCellSelection = {[weak self] match in
            self?.viewModel?.openStory(with: match.id!)
        }
    }
}
