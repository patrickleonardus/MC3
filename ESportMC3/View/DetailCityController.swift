//
//  DetailCityController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 28/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class DetailCityController: UITableViewController {
    
    var city = ["Kabupaten Bandung",
                "Kabupaten Bandung Barat",
                "Kabupaten Bekasi",
                "Kabupaten Bogor",
                "Kabupaten Ciamis",
                "Kabupaten Cianjur",
                "Kabupaten Cirebon",
                "Kabupaten Garut",
                "Kabupaten Indramayu",
                "Kabupaten Karawang",
                "Kabupaten Kuningan",
                "Kabupaten Majalengka",
                "Kabupaten Purwakarta",
                "Kabupaten Subang",
                "Kabupaten Sukabumi",
                "Kabupaten Sumedang",
                "Kabupaten Tasikmalaya",
                "Kota Bandung",
                "Kota Banjar",
                "Kota Bekasi",
                "Kota Bogor",
                "Kota Cimahi",
                "Kota Cirebon",
                "Kota Depok",
                "Kota Sukabumi",
                "Kota Tasikmalaya",
                "Kota Tangerang",
                "Kota Tangerang Selatan",
                "Kabupaten Administrasi Kepulauan Seribu",
                "Kota Administrasi Jakarta Barat",
                "Kota Administrasi Jakarta Pusat",
                "Kota Administrasi Jakarta Selatan",
                "Kota Administrasi Jakarta Timur",
                "Kota Administrasi Jakarta Utara",
                "Kota Yogyakarta",
                "Bali & Nusa Tenggara",
                "Nusa Tenggara Barat",
                "Nusa Tenggara Timur",
                "Sumatera Barat",
                "Sumatera Selatan",
                "Sumatera Utara",
                "Jambi",
                "Lampung",
                "Banten",
                "Jawa Tengah",
                "Jawa Timur",
                "Kalimantan Utara",
                "Kalimantan Tengah",
                "Kalimantan Timur",
                "Kalimantan Barat",
                "Kalimantan Selatan",
                "Banten",
                "Sulawesi Utara",
                "Sulawesi Tengah",
                "Sulawesi Selatan",
                "Sulawesi Tenggara",
                "Bengkulu",
                "Sulawesi Barat",
                "Maluku",
                "Papua"]
    var cityTemp = ""

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return city.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell")
        cell?.textLabel?.text = city[indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cityTemp = city[indexPath.row]
        performSegue(withIdentifier: "unwindToDetail", sender: self)
        performSegue(withIdentifier: "unwindFromCity", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToDetail" {
            let destination = segue.destination as! PlayerRegistrationController
            destination.cityTemp1 = cityTemp
        }
        else if segue.identifier == "unwindFromCity" {
            let destination = segue.destination as! TeamRegistrationController
            destination.cityTemp2 = cityTemp
        }
    }

}
