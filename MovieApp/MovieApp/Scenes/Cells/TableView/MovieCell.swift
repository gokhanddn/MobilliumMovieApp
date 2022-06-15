//
//  MovieCell.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import UIKit
import Kingfisher

final class MovieCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var imageViewMovie: UIImageView!
    
    // MARK: - Properties
    var movie: UpcomingMoviePresentation? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Methods
    private func updateUI() {
        guard let movie = movie else { return }
        
        labelTitle.text = movie.title
        labelOverview.text = movie.overview
        labelReleaseDate.text = movie.releaseDate
        imageViewMovie.layer.cornerRadius = 5
        imageViewMovie.kf.setImage(with: URL(string: movie.imageUrl))
    }
}
