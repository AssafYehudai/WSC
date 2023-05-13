//
//  MatchesTableView.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 10/05/2023.
//

import UIKit

enum Section {
    case main
}

class MatchesTableView: UITableView, UITableViewDelegate {

    // MARK: - Type aliases
    typealias DataSource = UITableViewDiffableDataSource<Section, UIMatch>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, UIMatch>
    
    // MARK: - Propeties
    internal var onCellSelection: Block<UIMatch>?
    internal lazy var diffableDataSource: DataSource = makeDataSource() {
        didSet { dataSource = diffableDataSource }
    }

    // MARK: - Constructor
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
        let nib = UINib(nibName: "MatchTableViewCell", bundle: .main)
        register(nib, forCellReuseIdentifier: "MatchTableViewCell")
        backgroundColor = .clear
    }
    
    // MARK: - Public
    func updateTable(with matches: [UIMatch]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(matches,toSection: .main)
        diffableDataSource.apply(snapshot)
    }
    
    // MARK: - Private
    internal func makeDataSource() -> DataSource {
        return DataSource(tableView: self, cellProvider: cellProvider)
    }
    
    // MARK: - Delegates
    func cellProvider(tableView: UITableView, indexPath: IndexPath, item: UIMatch) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchTableViewCell", for: indexPath)
        (cell as? MatchTableViewCell)?.config(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = diffableDataSource.itemIdentifier(for: indexPath) else { return }
        onCellSelection?(item)
        deselectRow(at: indexPath, animated: true)
    }
}
