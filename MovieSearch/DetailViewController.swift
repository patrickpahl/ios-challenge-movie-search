//
//  DetailViewController.swift
//  MovieSearch
//
//  Created by Patrick Pahl on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var movie: Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var vote_averageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UITextView!
    //@IBOutlet weak var poster_pathLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if movie != nil{
            
            self.titleLabel.text = movie?.title
            self.vote_averageLabel.text = String("Vote average: \(movie?.vote_average)")
            self.overviewLabel.text = movie?.overview
        }
    }

}







