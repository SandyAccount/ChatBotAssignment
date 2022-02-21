//
//  LoaderViewController.swift
//  BotAssistance
//
//  Created by Activ Health on 22/02/22.
//

import UIKit

class LoaderViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    static func loadView() -> LoaderViewController{
      let loader = LoaderViewController(nibName: "LoaderViewController", bundle: nil)
      loader.modalPresentationStyle = .overFullScreen
      return loader
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
