//
//  ViewController.swift
//  SwiftPlaces
//
//  Created by Joshua Smith on 7/25/14.
//  Copyright (c) 2014 iJoshSmith. All rights reserved.
//

import UIKit

/** Shows a search bar and lists places found by postal code. */
class SearchViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationItem.title = "Search"
        
        dataSource = ConcertDataSource(tableView: tableView)
        tableView.dataSource = dataSource
        tableView.delegate = self
        
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let concertVC = storyboard!.instantiateViewControllerWithIdentifier("ConcertViewController") as! ConcertViewController
        concertVC.concert = dataSource.concerts[indexPath.row]
        showDetailViewController(concertVC, sender: self)
    }

    // MARK: - UISearchBarDelegate
    
    // Called when the keyboard search button is pressed.
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        let input = searchBar.text?
            .stringByTrimmingCharactersInSet(
                NSCharacterSet.whitespaceCharacterSet())
        
        if let postalCode = input
        {
            if performSearchForPostalCode(postalCode)
            {
                searchBar.resignFirstResponder()
            }
            else
            {
                let image = UIImage(named: "ErrorColor")
                searchBar.showErrorMessage("Numbers only!", backgroundImage: image)
            }
        }
    }
    
    // MARK: - Search service
    
    private func performSearchForPostalCode(city: String) -> Bool
    {
        let valid = true
        if valid
        {
            let url = URLFactory.searchByCity(city)
            JSONService
                .GET(url)
                .success({json in {self.makeConcerts(json)} ~> {self.showConcerts($0)}})
                .failure(onFailure, queue: NSOperationQueue.mainQueue())
        }
        return valid
    }
    

    private func makeConcerts(json: AnyObject) -> [Concert] {
        if let concerts = BuildConcertsFromJSON(json) as? [Concert]
        {
            if let unique = NSSet(array: concerts).allObjects as? [Concert]
            {
                return unique.sorted { $0.concertInfoURI < $1.concertInfoURI }
            }
        }
        return []
    }

    
    private func showConcerts(concerts: [Concert]) {
        dataSource.concerts = concerts
    }
    
    private func onFailure(statusCode: Int, error: NSError?)
    {
        println("HTTP status code \(statusCode)")
        
        let
        title = "Error",
        msg   = error?.localizedDescription ?? "An error occurred.",
        alert = UIAlertController(
            title: title,
            message: msg,
            preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .Default,
            handler: { _ in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - State
    
    /*private var dataSource: PlaceDataSource!*/
    private var dataSource: ConcertDataSource!
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
}
