//
//  ConcertDataSource.swift
//  SwiftPlaces
//
//  Created by Kasbekar, Mangesh on 4/26/16.
//  Copyright (c) 2016 iJoshSmith. All rights reserved.
//

import UIKit


/** Manages Concert objects for the search controller's UITableView. */
class ConcertDataSource: NSObject, UITableViewDataSource
{
    init(tableView: UITableView)
    {
        self.tableView = tableView
    }
    
    var concerts: [Concert] = [] { didSet { tableView.reloadData() } }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return concerts.count
    }
    
    func tableView(tv: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let
        cell = tv.dequeueReusableCellWithIdentifier("") as? UITableViewCell
            ?? UITableViewCell(style: .Default, reuseIdentifier: ""),
        concert = concerts[indexPath.row]
        let cf = ConcertFormatter()
        cell.textLabel!.text = cf.formatConcertSummary(concert)
        return cell
    }
    
    // MARK: - State
    
    private weak var tableView: UITableView!
}
