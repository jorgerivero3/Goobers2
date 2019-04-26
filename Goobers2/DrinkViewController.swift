//
//  DrinkViewController.swift
//  Goobers2
//
//  Created by Jorge Rivero III on 4/26/19.
//  Copyright © 2019 Nolan Daniels. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

struct DrinkResponse: Codable {
    let drinks: [Drink]
}

struct Drink: Codable{
    var name: String?
    var imageURL: String?
    var idDrink: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case imageURL = "strDrinkThumb"
        case idDrink
    }
    
}

class DrinkViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var partyDrinks: [Drink]? = nil
    let decoder = JSONDecoder()
    @IBOutlet weak var ingredient: UITextField!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if partyDrinks != nil{
            print(partyDrinks!.count)
            return partyDrinks!.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DrinkCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinkCollectionViewCell.reuseCellIdentifier, for: indexPath) as! DrinkCollectionViewCell
        
        let url = partyDrinks![indexPath.row].imageURL!
        
        cell.image.load(url: URL(string: url)!)
        cell.name.text = (partyDrinks![indexPath.row]).name
        
        return cell 
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func showDrinks(_ sender: UIButton) {
        if ingredient.text! != "" {
            fetchJSON { (res) in
                switch res {
                case .success(let drinks):
                    self.partyDrinks = Array(drinks[0...10])
                    DispatchQueue.main.async() {
                        self.collectionView.reloadData()
                    }
                case .failure(let err):
                    print("Failed to fetch drinks:", err)
                }
            }
        }
    }
    
    fileprivate func fetchJSON(completion: @escaping (Result<[Drink], Error>) -> ()){
        let session = URLSession.shared
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=" + ingredient.text!
        
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { (data, res, err) in
            

            
            if err != nil{
                completion(.failure(err!))
                return
            }
            
            //Success
            do {
                let drinks = try JSONDecoder().decode(DrinkResponse.self, from: data!)
                completion(.success(drinks.drinks))
            } catch let jsonError{
                completion(.failure(jsonError))
            }
            
        }
        task.resume()
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
