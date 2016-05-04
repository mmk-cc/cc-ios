//
//  Concerts.swift
//  SwiftPlaces
//
//  Created by Kasbekar, Mangesh on 4/26/16.
//  Copyright (c) 2016 iJoshSmith. All rights reserved.
//

import Foundation

/**
Data entity that represents a Concert.
Subclasses NSObject to enable Obj-C instantiation.
*/
class Concert : NSObject, Equatable
{
    let
    concertInfoURI:   String,
    mainArtist: String,
    Genre: String,
    accompanyingArtists: String,
    auditorium: String,
    address: String,
    city: String,
    state: String,
    country: String,
    contactEmail: String,
    contacturl: String,
    festival: String,
    instrument: String,
    timestamp: String
    
    init(
        concertInfoURI:   String,
        mainArtist: String,
        Genre: String,
        accompanyingArtists: String,
        auditorium: String,
        address: String,
        city: String,
        state: String,
        country: String,
        contactEmail: String,
        contacturl: String,
        festival: String,
        instrument: String,
        timestamp: String
)
    {
        self.concertInfoURI = concertInfoURI
        self.mainArtist = mainArtist
        self.Genre = Genre
        self.accompanyingArtists = accompanyingArtists
        self.auditorium = auditorium
        self.address = address
        self.city = city
        self.state = state
        self.country = country
        self.contactEmail = contactEmail
        self.contacturl = contacturl
        self.festival = festival
        self.instrument = instrument
        self.timestamp = timestamp
    }
    
/*     // Used by Foundation collections, such as NSSet.
    override var hash: Int
        {
        get { return hashValue }
    }
    
   // I'm not sure where this is inherited from,
    // or if it needs to be overridden.
    override var hashValue: Int
        {
        get { return name.hashValue }
    }
*/
    // Used by Foundation collections, such as NSSet.
    override func isEqual(object: AnyObject!) -> Bool
    {
        return self == object as! Concert
    }
}

// Required for Equatable protocol conformance
func == (lhs: Concert, rhs: Concert) -> Bool
{
    return lhs.concertInfoURI == rhs.concertInfoURI
}
