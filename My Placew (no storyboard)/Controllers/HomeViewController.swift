//
//  ViewController.swift
//  My Placew (no storyboard)
//
//  Created by Максим on 10.11.2022.
//

import UIKit

protocol firstViewControllerDelegate: AnyObject {
    func fetchTheData(mynameTextfield: String, mytypeTextfield: String, mylocationTextfield: String, myNewPlaceImage: String?, image: UIImage)
}
    
class HomeViewController: UIViewController {
    
    let TableViewForPlaces = UITableView()
    var places = [Place(name: "Burger place", location: "Orlando", type: "Cafe", restaurantImage: "бургер", image: nil), Place(name: "MegaMeat", location: "Miami", type: "Grocery", restaurantImage: "бургер2", image: nil), Place(name: "Shaurma-City", location: "Moskow", type: "Cafe", restaurantImage: "шаурма", image: nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("llllllllllllllllllllllllll")
        configureNavigationBar()
        configureTableView()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .systemGreen
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBold", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            //NSAttributedString.Key.link: UIColor.red
        ]
        navigationItem.title = "My places"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.square.on.square"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(goToNextVC))
        navigationItem.rightBarButtonItem!.tintColor = .white
        
    }
    @objc func goToNextVC() {
        let SecondVC = AddPlaceViewController()
       SecondVC.delegate = self
        navigationController?.pushViewController(SecondVC, animated: true)
       
    }
    func configureTableView() {
        view.backgroundColor = UIColor.white
        TableViewForPlaces.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        TableViewForPlaces.frame = view.bounds
        TableViewForPlaces.rowHeight = 100
        TableViewForPlaces.delegate = self
        TableViewForPlaces.dataSource = self
        view.addSubview(TableViewForPlaces)
    }
}//endOfClass

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = places[indexPath.row].name
        cell.typeLabel.text = places[indexPath.row].type
        cell.locationLabel.text = places[indexPath.row].location
        
        //выбираем что отображается в ячейке, картинка по умолчанию из массива(если обьект уже существует в модели) либо новая картинка которую добавил PHPicker
        if places[indexPath.row].image == nil {
            cell.imageOfPlace.image = UIImage(named: places[indexPath.row].restaurantImage!)
        } else {
            cell.imageOfPlace.image = places[indexPath.row].image
        }
        return cell
    }
}

extension HomeViewController: firstViewControllerDelegate {

    func fetchTheData(mynameTextfield: String, mytypeTextfield: String, mylocationTextfield: String, myNewPlaceImage: String?, image: UIImage) {
        places.append(Place(name: mynameTextfield,
                            location: mylocationTextfield,
                            type: mytypeTextfield,
                            restaurantImage: myNewPlaceImage,
                            image: image))
        TableViewForPlaces.reloadData()
    }
}


