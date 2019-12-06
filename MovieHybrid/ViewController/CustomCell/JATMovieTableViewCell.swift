//
//  JATMovieTableViewCell.swift
//  MovieHybrid
//
//  Created by Anthony Torres on 12/6/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

class JATMovieTableViewCell: UITableViewCell {
    
    var movie: JATMovie? {
        didSet
        {
            titleLabel.text = movie?.title
            ratingLabel.text = "Rating: \(movie?.rating ?? 0)"
            summaryLabel.text = movie?.summary
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
}
