//
//  ViewController.swift
//  random_colors
//
//  Created by Manoj Jalam on 3/4/23.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    var colors: [UIColor]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        AddRandomColors()
        // Do any additional setup after loading the view.
    }
    
    func AddRandomColors(){
        for _ in 0..<50{
            colors.append(CreateRandomColor())
        }
    }
    
    func CreateRandomColor() -> UIColor{
        let randomColor = UIColor(red: CGFloat.random(in: 0...1.0),
                                  green: CGFloat.random(in: 0...1.0),
                                  blue: CGFloat.random(in: 0...1.0),
                                  alpha: 1)
        return randomColor
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVCViewController
        destVC.color = sender as? UIColor
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else{
            return UITableViewCell()
        }
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorDetailVC" , sender: color )
    }
    

   
}

 
