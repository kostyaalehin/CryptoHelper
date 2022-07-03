//
//  ViewController.swift
//  myCryptoHelper
//
//  Created by Константин Алехин on 02.07.2022.
//

import UIKit

class CryptoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var viewModels = [CryptoTableViewCellViewModel]()


    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
        tableView.delegate = self
        tableView.dataSource = self

        NomicsAPICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                print(models.count)
                print(models[0].name! + " " + models[0].price!)
                self?.viewModels = models.compactMap({
                    CryptoTableViewCellViewModel(
                        name: $0.name ?? "", symbol: $0.symbol ?? "", price: $0.price ?? "")
                })

                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }

            case .failure(_):
                print("no good")
            }
        }
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
}

