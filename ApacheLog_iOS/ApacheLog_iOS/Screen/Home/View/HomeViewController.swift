//
//  HomeViewController.swift
//  ApacheLog_iOS
//
//  Created by Scor Doan on 10/03/2021.
//

import Foundation
import UIKit
import Combine

class HomeViewController: UIViewController, UIViewControllerConfigurable {
    
    var topBarView: UIView! = {
       let view = UIView()
        view.backgroundColor = .secondaryBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var pagesLabel: UILabel! = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.brandRed
        label.font = UIFont.boldBody
        label.textAlignment = .left
        label.text = "Pages"
        return label
    }()
    
    var frequencyLabel: UILabel! = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.brandRed
        label.font = UIFont.boldBody
        label.textAlignment = .right
        label.text = "Frequency"
        return label
    }()
    
    var tableview: UITableView! = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .clear
        tableview.separatorStyle = .none
        return tableview
    }()
    
    var loadingView: UIActivityIndicatorView! = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()
    
    
    private var viewModel: HomeViewModel!
    private var dataSource: LogSequencesDataSource!
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        constraintsInit()
        bindViewModel()
        updateUI()
    }
    
    func setupComponents() {
        title = "Apache Log"
        view.backgroundColor = UIColor.primaryBackground
        topBarView.addSubview(pagesLabel)
        topBarView.addSubview(frequencyLabel)
        view.addSubview(topBarView)
        view.addSubview(tableview)
        view.addSubview(loadingView)
        
        dataSource = LogSequencesDataSource(delegate: viewModel)
        tableview.dataSource = dataSource
        tableview.delegate = dataSource
        tableview.register(LogSequenceViewCell.self, forCellReuseIdentifier: LogSequenceViewCell.typeName)
        
    }
    
    
    func constraintsInit() {
        //Constraints
        NSLayoutConstraint.activate([
            topBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBarView.bottomAnchor.constraint(equalTo: tableview.topAnchor),
            topBarView.heightAnchor.constraint(equalToConstant: CGFloat.topBarHeight),
            
            pagesLabel.topAnchor.constraint(equalTo: topBarView.topAnchor),
            pagesLabel.leadingAnchor.constraint(equalTo: topBarView.leadingAnchor, constant: CGFloat.defaultSpacing),
            pagesLabel.bottomAnchor.constraint(equalTo: topBarView.bottomAnchor),
            
            frequencyLabel.topAnchor.constraint(equalTo: topBarView.topAnchor),
            frequencyLabel.trailingAnchor.constraint(equalTo: topBarView.trailingAnchor, constant: -CGFloat.defaultSpacing),
            frequencyLabel.bottomAnchor.constraint(equalTo: topBarView.bottomAnchor),
            
            //tableview
            tableview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat.defaultSpacing),
            
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func bindViewModel() {
        func bindViewModelToView() {
            let tableViewReloadHandler: ([LogSequence]) -> Void = { [weak self] _ in
                self?.tableview.reloadData()
            }
            
            viewModel.$sequences
                .receive(on: RunLoop.main)
                .sink(receiveValue: tableViewReloadHandler)
                .store(in: &bindings)
            
            let stateHandler: (ViewModelState) -> Void = { [weak self] state in
                switch state {
                case .loading:
                    print("loading....")
                    self?.loadingView.startAnimating()
                case .error(let error):
                    print("error....\(error)")
                    self?.loadingView.stopAnimating()
                default:
                    print("stop....")
                    self?.loadingView.stopAnimating()
                }
            }

            viewModel.$state
                .receive(on: RunLoop.main)
                .sink(receiveValue: stateHandler)
                .store(in: &bindings)
            
        }

        bindViewModelToView()
        viewModel.downloadLogFile()
    }
    
    
    func updateUI() {
    }
    
}
