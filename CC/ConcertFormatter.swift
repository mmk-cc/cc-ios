//
//  ConcertFormatter.swift
//  SwiftPlaces
//
//  Created by Kasbekar, Mangesh on 4/26/16.
//  Copyright (c) 2016 iJoshSmith. All rights reserved.
//

import Foundation

/** Creates display text from a Concert object. */
class ConcertFormatter {

    func formatConcertSummary(concert: Concert) -> String {
            var x = concert.timestamp.componentsSeparatedByString(" ")
            return x[0] + " " + concert.mainArtist
    }
    
    func formatInstrumentAndGenre(concert: Concert) -> String {
        var retVal = ""
        if !concert.instrument.isEmpty {
            retVal += concert.instrument
        }
        if !concert.Genre.isEmpty {
            retVal += " (" + concert.Genre + ")"
        }
        return retVal
    }

    func formatAccompanyingArtists(concert: Concert) -> String {
        if !concert.accompanyingArtists.isEmpty {
                return concert.accompanyingArtists
        }
        return ""
    }

    func formatAuditoriumAddress(concert: Concert) -> String {
        var retVal = ""
        if !concert.auditorium.isEmpty {
            retVal = concert.auditorium  + ", "
        }
        if !concert.address.isEmpty {
            retVal += concert.address + ", "
        }
        if (!concert.city.isEmpty) {
            retVal += concert.city + ", "
        }
        if (!concert.state.isEmpty) {
            retVal += concert.state + ", "
        }
        if (!concert.country.isEmpty) {
            retVal += concert.country
        }
        return retVal
    }
    
    func formatOrganizerURL(concert: Concert) -> String {
        if !concert.contacturl.isEmpty {
            return concert.contacturl
        }
        return ""
    }

    func formatFestival(concert: Concert) -> String {
        if !concert.festival.isEmpty {
            return concert.festival
        }
        return ""
    }

    
    func formatConcert(concert: Concert) -> String {
        var retVal = "Main Artist: " + concert.mainArtist + "\n"
        
        if (!concert.accompanyingArtists.isEmpty) {
            retVal += "Accompanying Artists: " + concert.accompanyingArtists + "\n"
        }
        if (!concert.instrument.isEmpty) {
            retVal += "Vocal/Instrumental: " + concert.instrument + "\n"
        }
        if (!concert.Genre.isEmpty) {
            retVal += "Genre: " + concert.Genre + "\n"
        }
        if (!concert.festival.isEmpty) {
            retVal += "Festival: " + concert.festival + "\n"
        }
        if (!concert.timestamp.isEmpty) {
            retVal += "Time: " + concert.timestamp + "\n"
        }
        if (!concert.auditorium.isEmpty) ||
            (!concert.address.isEmpty) ||
            (!concert.city.isEmpty) ||
            (!concert.state.isEmpty) ||
            (!concert.country.isEmpty) {
            retVal += "Location: "
            if !concert.auditorium.isEmpty {
                retVal += concert.auditorium + ", "
            }
            if !concert.address.isEmpty {
                retVal += concert.address + ", "
            }
            if (!concert.city.isEmpty) {
                retVal += concert.city + ", "
            }
            if (!concert.state.isEmpty) {
                retVal += concert.state + ", "
            }
            if (!concert.country.isEmpty) {
                retVal += concert.country
            }
            retVal += "\n"
        }
        if (!concert.contacturl.isEmpty) {
            retVal += "Announcement: " + concert.contacturl + "\n"
        }
        if (!concert.contactEmail.isEmpty) {
            retVal += "Organizer's email: " + concert.contactEmail + "\n"
        }
        
        return retVal
    }
    
}
