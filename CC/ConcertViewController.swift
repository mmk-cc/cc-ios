//
//  ConcertViewController.swift
//  SwiftPlaces
//
//  Created by Kasbekar, Mangesh on 4/26/16.
//  Copyright (c) 2016 iJoshSmith. All rights reserved.
//

import UIKit

/* Displays detailed information */
class ConcertViewController : UIViewController, UIGestureRecognizerDelegate {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var concert: Concert!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //navigationController?.navigationBar.translucent = false
        navigationItem.title = "Concert Info"
        nameLabel.text = concert.mainArtist
        self.title = "Detail"
        let concertFormatter = ConcertFormatter()
        InstrumentAndGenre.text = concertFormatter.formatInstrumentAndGenre(concert)
        accompanyingArtists.text = concertFormatter.formatAccompanyingArtists(concert)
        dateTime.text = concert.timestamp
        addy.text = concertFormatter.formatAuditoriumAddress(concert)
        organizerURL.text = concertFormatter.formatOrganizerURL(concert)
        festivalSeries.text = concertFormatter.formatFestival(concert)
    }
        
    // MARK: - Outlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet weak var InstrumentAndGenre: UITextField!
    @IBOutlet weak var accompanyingArtists: UITextField!
    @IBOutlet weak var dateTime: UITextField!
    @IBOutlet weak var organizerURL: UITextField!
    @IBOutlet weak var festivalSeries: UITextField!
    @IBOutlet weak var addy: UITextView!
    @IBOutlet weak var closeMe: UILabel!
    @IBOutlet weak var saveMe: UILabel!
}
