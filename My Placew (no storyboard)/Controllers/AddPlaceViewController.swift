//
//  AddPlaceViewController.swift
//  My Placew (no storyboard)
//
//  Created by Максим on 21.11.2022.
//
import Photos
import PhotosUI
import UIKit
import IQKeyboardManagerSwift

class AddPlaceViewController: UIViewController {
    var myView = UIImageView()
    let tableView = UITableView()
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let stackView = UIStackView()
    let locationTextField = UITextField()
    let locationLabel = UILabel()
    let typeLabel = UILabel()
    var typeTextField = UITextField()
    var delegate: firstViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"plus.square.on.square"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(fetchTheDataToPreviousVC))
        createAddPlaceTableView()
        //hideButtonSave()
        nameTextField.addTarget(self, action: #selector(hideButtonSave), for: .editingChanged)
        //tapGestureConfiguration()
        // configureStackView()
    }
    
    func createAddPlaceTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.frame = CGRect(x: 0, y: 0, width: Int(view.frame.size.width), height: Int(view.frame.size.height))
        //tableView.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: Int(UIScreen.main.bounds.size.height))
        tableView.backgroundColor = .systemGreen
        //tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    @objc func fetchTheDataToPreviousVC() {
        
        guard let delegate = delegate else { return }
        guard nameTextField.text != "", typeTextField.text != "", locationTextField.text != "", myView.image != nil else {return callAlertWithNotification()}
        delegate.fetchTheData(mynameTextfield: nameTextField.text!, mytypeTextfield: typeTextField.text!, mylocationTextfield: locationTextField.text!, myNewPlaceImage: nil, image: myView.image! )
        navigationController?.popViewController(animated: true)
    }
    
    func callAlertWithNotification() {
        let alert = UIAlertController(title: "Not enough data to continue!", message: "Please, fill all the fields and attach photo", preferredStyle: .alert)
        let action = UIAlertAction(title: "Get it!", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //    func tapGestureConfiguration() {
    //        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(thatWasTap))
    //        view.addGestureRecognizer(tapGesture)
    //    }
    //    @objc func thatWasTap() {
    //        view.endEditing(true)
    //    }
    //
    
    func ConfugureStackView(cellForStackView: UITableViewCell, label: UILabel, textfield: UITextField) {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textfield)
        cellForStackView.addSubview(stackView)
        
        //констрейнты для ячеек
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: cellForStackView.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: cellForStackView.trailingAnchor, constant: -15).isActive = true
        stackView.topAnchor.constraint(equalTo: cellForStackView.topAnchor, constant: 15).isActive = true
    }
    
    @objc func hideButtonSave() {
//        navigationItem.rightBarButtonItem!.isEnabled = !nameTextField.text!.isEmpty && !locationTextField.text!.isEmpty && !typeTextField.text!.isEmpty
        if nameTextField.text!.isEmpty == false {
            navigationItem.rightBarButtonItem!.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem!.isEnabled = false
        }
    }
} //END OF CLASS

extension AddPlaceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cellZeroForAddVC = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            tableView.rowHeight = 300
            myView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: tableView.rowHeight)
            cellZeroForAddVC.addSubview(myView)
            return cellZeroForAddVC
        }
        
        if indexPath.row == 1 {
            let cellForAddVC = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            tableView.rowHeight = 100
            //            nameLabel.frame.size = CGSize(width: 150, height: 30)
            //            nameLabel.frame.origin = CGPoint(x: 15, y: 10)
            nameLabel.text = "Name"
            nameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 22)
            //nameLabel.font = nameLabel.font.withSize(30)
            cellForAddVC.addSubview(nameLabel)
            
            
            //nameTextField.frame = CGRect(x: 15, y: 40, width: 200, height: 25)
            nameTextField.contentHorizontalAlignment = .left
            nameTextField.contentVerticalAlignment = .bottom
            nameTextField.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
            nameTextField.font = UIFont.boldSystemFont(ofSize: 18)
            nameTextField.placeholder = "Place the name here"
            //textFieldOne.autocapitalizationType = UITextAutocapitalizationType.sentences
            nameTextField.borderStyle = .none
            nameTextField.delegate = self
            cellForAddVC.contentView.addSubview(nameTextField)
            cellForAddVC.selectionStyle = .none
            
            //все констрейнты содержатся в stacView, поэтому отдельно для каждой ячейки прописывать их не нужно
            ConfugureStackView(cellForStackView: cellForAddVC, label: nameLabel, textfield: nameTextField)
            return cellForAddVC
        }
        
        if indexPath.row == 2 {
            let cellForAddVCTwo = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            //locationLabel.frame.size = CGSize(width: 150, height: 30)
            //locationLabel.frame.origin = CGPoint(x: 15, y: 10)
            locationLabel.text = "Location"
            locationLabel.font = UIFont(name: "HelveticaNeue-Light", size: 22)
            cellForAddVCTwo.addSubview(locationLabel)
            
            //locationTextField.frame = CGRect(x: 15, y: 40, width: 200, height: 25)
            locationTextField.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
            locationTextField.placeholder = "Place location here"
            locationTextField.delegate = self
            cellForAddVCTwo.contentView.addSubview(locationTextField)
            cellForAddVCTwo.selectionStyle = UITableViewCell.SelectionStyle.none
            //все констрейнты содержатся в stacView, поэтому отдельно для каждой ячейки прописывать их не нужно
            ConfugureStackView(cellForStackView: cellForAddVCTwo, label: locationLabel, textfield: locationTextField)
            return cellForAddVCTwo
        } else {
            let cellForAddVC = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            // typeLabel.frame.size = CGSize(width: 150, height: 30)
            // typeLabel.frame.origin = CGPoint(x: 15, y: 10)
            typeLabel.text = "Type"
            typeLabel.font = UIFont(name: "HelveticaNeue-Light", size: 22)
            cellForAddVC.addSubview(typeLabel)
            tableView.rowHeight = 100
            
            //            typeTextField.frame = CGRect(x: 15, y: 40, width: 200, height: 25)
            typeTextField.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
            typeTextField.placeholder = "Place the type here"
            typeTextField.delegate = self
            cellForAddVC.contentView.addSubview(typeTextField)
            cellForAddVC.selectionStyle = .none
            //все констрейнты содержатся в stacView, поэтому отдельно для каждой ячейки прописывать их не нужно
            ConfugureStackView(cellForStackView: cellForAddVC, label: typeLabel, textfield: typeTextField)
            return cellForAddVC
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            addPHPicker()
        } else {
            view.endEditing(true)
        }
    }
    
    
}
extension AddPlaceViewController: PHPickerViewControllerDelegate {
    func addPHPicker() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images
        let phPicker = PHPickerViewController(configuration: config)
        phPicker.delegate = self
        present(phPicker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { (object, Error) in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        self.myView.image = image
                    
                    
                    }
                }
            }
            
        }
    }
    
}
extension AddPlaceViewController: UITextFieldDelegate {//не забудь подписать на делегат каждый textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

