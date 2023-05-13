//
//  MatchTableViewCell.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 10/05/2023.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var awayIcon: UIImageView!
    @IBOutlet weak var homeIcon: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        container.backgroundColor = .systemGray5
        container.layer.cornerRadius = 8
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        homeIcon.image = nil
        awayIcon.image = nil
        thumbnail.image = nil
    }
    
    func config(with match: UIMatch) {
        homeIcon.load(stringUrl: match.teams?.home?.logo, fallback: .team_empty_icon)
        awayIcon.load(stringUrl: match.teams?.away?.logo, fallback: .team_empty_icon)
        homeTeamName.text = match.teams?.home?.name
        awayScore.text = match.teams?.away?.name
        homeScore.text = String(match.homeScore)
        awayScore.text = String(match.awayScore)
        thumbnail.load(stringUrl: match.storyThumbnail, fallback: nil)
    }
}
