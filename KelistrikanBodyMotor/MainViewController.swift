//
//  MainViewController.swift
//  KelistrikanBodyMotor
//
//  Created by Muhammad Firdaus on 30/04/21.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var zoomTable: UITableView!
    
    var arrZoom: [ZoomBackground] = []
    var highlight:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Kelistrikan Bodi Motor"
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        setupTable()
        addData()
        
        zoomTable.dataSource = self
        //kasih tau data ke table
        zoomTable.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }

    func setupTable(){
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        zoomTable.register(nib, forCellReuseIdentifier: "custom1")
    }
    
    func addData(){
        let a = ZoomBackground(title: Judul.lampuNetral, detail: "dipakai saat setuju dengan teman", image: "Lampu_Netral")
        arrZoom.append(a)
        let b = ZoomBackground(title: Judul.klakson, detail: "dipakai saat mau potong rambut", image: "Klakson-Image")
        arrZoom.append(b)
        let c = ZoomBackground(title: Judul.lampuRem, detail: "dipakai saat ingin terlihat mewah", image: "Lampu_Belakang")
        arrZoom.append(c)
        let d = ZoomBackground(title: Judul.lampuSein, detail: "dipakai saat ingin terlihat mewah", image: "Lampu_Sein")
        arrZoom.append(d)
        let e = ZoomBackground(title: Judul.lampuKepala, detail: "dipakai saat ingin terlihat mewah", image: "Lampu_Depan")
        arrZoom.append(e)
    }
}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrZoom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = zoomTable.dequeueReusableCell(withIdentifier: "custom1") as! CustomTableViewCell
        
        //tiap cell punya data zoom background
        cell.zoomBackground = arrZoom[indexPath.row]
        cell.updateUI()
        
        return cell
    }
    
    
}

extension MainViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return zoomTable.frame.height / 5
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        zoomTable.deselectRow(at: indexPath, animated: true)
        
        let viewController = storyboard?.instantiateViewController(identifier: "MateriDetailViewController") as! MateriDetailViewController
        viewController.judulMateri = arrZoom[indexPath.row].title
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

