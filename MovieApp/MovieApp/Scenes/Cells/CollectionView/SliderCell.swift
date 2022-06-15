//
//  SliderCell.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import UIKit

final class SliderCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var imageViewMovie: UIImageView!
    
    // MARK: - Properties
    var movie: NowPlayingMoviePresentation? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Methods
    private func updateUI() {
        guard let movie = movie else { return }
        
        labelTitle.text = movie.title
        labelOverview.text = movie.overview
        imageViewMovie.kf.setImage(with: URL(string: movie.imageUrl))
    }
}
