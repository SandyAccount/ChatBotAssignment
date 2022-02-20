//
//  DashboardViewController.swift
//  BotAssistance
//
//  Created by Activ Health on 18/02/22.
//

import UIKit

class ListBotViewController: UIViewController{
    // MARK: - Iboutlet and Global Variable Declaration
    @IBOutlet weak var tableviewListBot: UITableView!
    var listBotViewModel:ListBotViewModel?
    
    // MARK: - Nib Initialization
    static func loadDashboardView() -> ListBotViewController{
        let listBot = ListBotViewController(nibName: "ListBotViewController", bundle: nil)
        listBot.title = "Bot Assistance"
        return listBot
    }
    
    // MARK: - View Life Cycle Delegate Method
    override func viewDidLoad(){
        super.viewDidLoad()
        setNavigation()
        registerCell()
        listBotViewModel = ListBotViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerObserver()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeObserver()
    }
    
    // MARK: - Observer - Register Notification Observer
    private func registerObserver()  {
        NotificationCenter.default.addObserver(self, selector: #selector(self.routeToDetail(notification:)), name: Notification.Name("Route"), object: nil)
    }
    // MARK: - Register Uitableview and Collectionview Cell
    private func registerCell(){
        tableviewListBot.register(UINib(nibName:"ListBotTableViewCell", bundle: nil), forCellReuseIdentifier: "ListBot")
    }
    // MARK: - Navigation Bar SetUp
    private func setNavigation(){
        navigationController?.setNavigationTheme(isBackBarButton: false, isRightBarButton: true, navigationTitle:"")
    }
    // MARK: - Observer - Remove Notification Observer
    private func removeObserver(){
        NotificationCenter.default.removeObserver(self, name: Notification.Name("Route"), object: nil)
    }
}

// MARK: - Other Function
extension ListBotViewController{
     @objc fileprivate func routeToDetail(notification: Notification) {
        let botView = AddBotViewController.loadCreateBotView()
        botView.delegate = self
        botView.modalPresentationStyle = .overFullScreen
        self.present(botView, animated: true)
    }
}

