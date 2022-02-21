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
    @IBOutlet weak var labelNoData: UILabel!
    var listBotViewModel:ListBotViewModel?
    // MARK: - Nib Initialization
    static func loadListBotView() -> ListBotViewController{
        let listBot = ListBotViewController(nibName: "ListBotViewController", bundle: nil)
        listBot.title = "Bot Assistance"
        return listBot
    }
    // MARK: - View Life Cycle Delegate Method
    override func viewDidLoad(){
        super.viewDidLoad()
        setNavigation()
        registerCell()
        listBotViewModel = ListBotViewModel(view: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Bot Assistance"
        self.tableviewListBot.reloadData()
        self.tableviewListBot.isHidden = listBotViewModel?.hideTableview() ?? false ? true : false
        listBotViewModel?.registerObserver()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        listBotViewModel?.removeObserver()
    }
    // MARK: - Navigation Bar SetUp
    private func setNavigation(){
        navigationController?.setNavigationTheme(isBackBarButton: false, isRightBarButton: true, navigationTitle:"")
    }
    // MARK: - Register Uitableview and Collectionview Cell
    private func registerCell(){
        tableviewListBot.register(UINib(nibName:"ListBotTableViewCell", bundle: nil), forCellReuseIdentifier: "ListBot")
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
/*
Note -:
 1. Listbotviewcontroller -> View
   set navigation, set registercell
 2. ListBotViewModel -> viewmodel
    Fetch Data from local json
 3. ChatViewModel -> Model
    Assign Data to model from local json
 4. ExtentionListBot -> Tableview and other delegate method
    Bind data with Tableview
*/

