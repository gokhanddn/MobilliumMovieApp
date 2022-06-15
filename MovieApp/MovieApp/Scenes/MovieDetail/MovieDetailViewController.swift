//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import UIKit
import Kingfisher

final class MovieDetailViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelOverview: UILabel!
    @IBOutlet private weak var labelReleaseDate: UILabel!
    @IBOutlet private weak var labelVoteAverage: UILabel!
    @IBOutlet private weak var imageViewMovie: UIImageView!
    @IBOutlet private weak var viewDivider: UIView! {
        didSet {
            viewDivider.layer.cornerRadius = viewDivider.bounds.size.height / 2
        }
    }
    
    // MARK: - Properties
    /// View Models
    var viewModel: MovieDetailViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    // MARK: - Life cycle methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
    }
    
    // MARK: - Methods
    private func updateUI(_ presentation: MovieDetailPresentation) {
        labelTitle.text = presentation.title
        labelOverview.text = presentation.overview
        labelReleaseDate.text = presentation.releaseDate
        labelVoteAverage.text = "\(presentation.voteAverage)"
        imageViewMovie.kf.setImage(with: URL(string: presentation.imageUrl))
    }
}

// MARK: - MovieListViewModelDelegate
extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func handleViewModelOutput(_ output: MovieDetailViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            print("isLoading \(isLoading)")
        case .updateTitle(let title):
            DispatchQueue.main.async {
                self.title = title
            }
        case .showMovieDetail(let movieDetail):
            DispatchQueue.main.async {
                self.updateUI(movieDetail)
            }
        }
    }
}

