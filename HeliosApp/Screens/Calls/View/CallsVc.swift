//
//  CallsVc.swift
//  HeliosApp
//
//  Created by Pavel Mac on 17/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class CallsVc: UIViewController {

    @IBOutlet weak var callSegment: UISegmentedControl!
    @IBOutlet weak var callsTableView: UITableView! {
        didSet {
            callsTableView.register(CallTableViewCell.nib, forCellReuseIdentifier: CallTableViewCell.id)
        }
    }
    
    var calls = [CallsModel]() {
        didSet {
            callsTableView.reloadData()
        }
    }
    
    let viewModel = CallsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentBtn(callSegment)
    }
    
    @IBAction func segmentBtn(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.calls = self.viewModel.allCalls
        } else {
            self.calls = viewModel.allCalls.filter { $0.callType == .missed }
        }
    }
    
    @IBAction func editCallBtnClick(_ sender: UIBarButtonItem) {
        if callsTableView.isEditing {
            callsTableView.setEditing(false, animated: true)
            sender.title = "Edit"
        } else {
            callsTableView.setEditing(true, animated: true)
            sender.title = "Done"
        }
    }
}


extension CallsVc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CallTableViewCell.id, for: indexPath) as? CallTableViewCell else {
            fatalError()
        }
        cell.callData = calls[indexPath.row]
        return cell
    }
}


extension CallsVc: UITableViewDelegate {
    //
}
