//
//  MovieRegisterViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 09/04/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class MovieRegisterViewController: UIViewController {

    //MARK: - Lets and Vars
    var movie: Movie!
    
    //MARK: - IBOutlets
    @IBOutlet weak var labelCategories: UILabel!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var btAddUpdate: UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if movie != nil {
            titleTextField.text = movie.title
            ratingTextField.text = "\(movie.rating)"
            durationTextField.text = movie.duration
            summaryTextView.text = movie.summary
            btAddUpdate.setTitle("Atualizar", for: .normal)
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addUpdateBtnClicked(_ sender: Any) {
        if movie == nil {
            movie = Movie(context: context)
        }
        movie.title = titleTextField.text
        movie.rating = Double(ratingTextField.text!)!
        movie.summary = summaryTextView.text
        movie.duration = durationTextField.text
        
        do {
            try context.save()
            self.dismiss(animated: true, completion: nil)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
