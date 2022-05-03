//
//  ViewController.swift
//  UITableViewAddTextInCode
//
//  Created by Андрей Сапожников on 30.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var objects: [Text] = []
    
    struct Cells {
        static let textCell = "textCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
//        objects = getText()
        configureTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapButton))
    }
    
    func setUpNavigation() {
//        navigationItem.title = "Add text"
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white

    }
    
    @objc private func didTapButton() {
        let rootVC = NewTextViewController()
        rootVC.delegate = self
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
//        set delegates
        setTableViewDelegates()
//        set row height
        tableView.rowHeight = 50
//        register cells
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: Cells.textCell)
//        set constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
 
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.textCell) as! TextTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)
        return cell
    }

}

extension ViewController: AddTextDelegate {
    func addText(text: Text) {
        self.dismiss(animated: true) {
            self.objects.append(text)
            self.tableView.reloadData()
        }
    }
    
    
}

//extension ViewController {
//    func getText() -> [Text] {
//        let  text = [
//            Text(text: "first"),
//            Text(text: "second"),
//            Text(text: "third"),
//            Text(text: "fourth"),
//            Text(text: "fifth")
//            ]
//        return text
//    }
//}


