//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by GOKHAN on 15.06.2022.
//

import UIKit

final class MovieListViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableViewMovie: UITableView!
    
    // MARK: - Properties
    /// View Models
    var viewModel: MovieListViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    /// Variables
    var nowPlayingMovieList: [NowPlayingMoviePresentation] = []
    var upcomingMovieList: [UpcomingMoviePresentation] = []
    private var currentPage = 1
    let refreshControl = UIRefreshControl()
    
    // MARK: - Life cycle methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadNowPlayingMovies()
        loadUpcomingMovies()
    }
    
    // MARK: - Setup & Initializers
    private func setup() {
        registerNibs()
        setDataSourcesAndDelegates()
        initPullToRefresh()
    }
    
    private func registerNibs() {
        tableViewMovie.register(UINib(nibName: Constants.ReuseIdentifiers.movieCell, bundle: nil), forCellReuseIdentifier: Constants.ReuseIdentifiers.movieCell)
        tableViewMovie.register(UINib(nibName: Constants.ReuseIdentifiers.loadingMore, bundle: nil), forHeaderFooterViewReuseIdentifier: Constants.ReuseIdentifiers.loadingMore)
        tableViewMovie.register(UINib(nibName: Constants.ReuseIdentifiers.sliderHeaderView, bundle: nil), forHeaderFooterViewReuseIdentifier: Constants.ReuseIdentifiers.sliderHeaderView)
    }
    
    private func setDataSourcesAndDelegates() {
        tableViewMovie.dataSource = self
        tableViewMovie.delegate = self
    }
    
    private func initPullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableViewMovie.addSubview(refreshControl)
    }
    
    // MARK: - Methods
    private func loadNowPlayingMovies() {
        viewModel?.loadNowPlayingMovies()
    }
    
    private func loadUpcomingMovies() {
        viewModel?.loadUpcomingMovies(in: currentPage)
    }
    
    private func reloadTableView() {
        tableViewMovie.reloadData()
    }
    
    // MARK: - Selectors
    @objc func refresh(_ sender: AnyObject) {
        currentPage = 1
        loadUpcomingMovies()
    }
    
    @objc func loadMoreTapped(sender: UIButton) {
        sender.isHidden = true
        currentPage += 1
        loadUpcomingMovies()
    }
}

// MARK: - MovieListViewModelDelegate
extension MovieListViewController: MovieListViewModelDelegate {
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            print("isLoading \(isLoading)")
        case .showNowPlayingMovieList(let movies):
            DispatchQueue.main.async {
                self.nowPlayingMovieList = movies
                self.reloadTableView()
            }
        case .showUpcomingMovieList(let movies):
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.upcomingMovieList = movies
                self.reloadTableView()
            }
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let movieId):
            if let viewController = MovieDetailBuilder.make(with: movieId) {
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.movieCell, for: indexPath) as? MovieCell
        cell?.movie = upcomingMovieList[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectMovie(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.ReuseIdentifiers.sliderHeaderView) as? SliderHeaderView
        headerView?.movieList = nowPlayingMovieList
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if viewModel?.isLoadingMoreVisible() ?? false {
            let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.ReuseIdentifiers.loadingMore) as? LoadingMoreFooterView
            footerView?.activityIndicator.startAnimating()
            footerView?.buttonLoadMore.isHidden = false
            footerView?.buttonLoadMore.addTarget(self, action: #selector(loadMoreTapped(sender:)), for: .touchUpInside)
            return footerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 256
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if viewModel?.isLoadingMoreVisible() ?? false {
            return 66
        }
        return 0.1
    }
}

