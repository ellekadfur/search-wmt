//
//  ViewController.swift
//  demoList
//
//  Created by Elle Kadfur on 02/28/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var searchbarCountry: UISearchBar!
    @IBOutlet weak var tablViewCountryList: UITableView!
    
    // MARK: - Variables
    var arrCountryList = [CountryModel]()
    var filteredCountryList = [CountryModel]()
    
    
    // MARK: - View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tablViewCountryList.register(UINib(nibName: "CountryListTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryListTableViewCell")
        tablViewCountryList.delegate = self
        tablViewCountryList.dataSource = self
        
        
        searchbarCountry.delegate = self
        searchbarCountry.placeholder = "Search by Country or Capital"
        searchbarCountry.setNeedsDisplay()
        
        fetchCountryList()
    }
    
    
    // MARK: - API Services
    func fetchCountryList() {
        APIServices.instance.getCountryList { countryList in
            self.arrCountryList = countryList
            self.filteredCountryList = countryList
            DispatchQueue.main.async {
                self.tablViewCountryList.reloadData()
            }
        } onFailure: { error in
            print("Error: \(error)")
        }
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    // MARK: - TableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryListTableViewCell", for: indexPath) as! CountryListTableViewCell
        let country = filteredCountryList[indexPath.row]
        cell.labelCountryCode.text = country.code
        cell.labelCountryName.text = "\(country.name), \(country.region)"
        cell.labelCountryCapital.text = country.capital
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    // MARK: - Searchbar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let lowercasedSearchText = searchText.lowercased()
        if searchText.isEmpty {
            filteredCountryList = arrCountryList
        } else {
            filteredCountryList = arrCountryList.filter { country in
                return country.name.lowercased().contains(lowercasedSearchText) ||
                country.capital.lowercased().contains(lowercasedSearchText)
            }
        }
        tablViewCountryList.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredCountryList = arrCountryList
        tablViewCountryList.reloadData()
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
