//
//  SettingsTableViewController.swift
//  LivingBIM
//
//  Created by Morio Ramdenbourg on 11/8/17.
//  Copyright © 2017 CAEE. All rights reserved.
//

import UIKit

fileprivate let cls = "SettingsTableViewController"

class SettingsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate
        tableView.delegate = self
        
        // Set data source
        tableView.dataSource = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Keys.Settings.NumSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return Keys.Settings.Box.NumRows
        case 1: return Keys.Settings.Location.NumRows
        case 2: return Keys.Settings.Profile.NumRows
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return Keys.Settings.Box.Title
        case 1: return Keys.Settings.Location.Title
        case 2: return Keys.Settings.Profile.Title
        default: return ""
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Keys.Settings.Cell, for: indexPath) as! SettingsTableViewCell
        
        // Calculate and set the tag - this limits the number of rows to 1000
        cell.tag = (indexPath.section * Keys.Settings.MaxRows) + indexPath.row
        
        // Add the title of the cell
        switch indexPath.section {
        case 0: // Box Section
            switch indexPath.row {
            case 0:
                cell.setTitle("Account")
                let credentials = getBoxCredentials()
                cell.setButton(credentials?.login ?? cell.loggedOutMsg) // Put label on screen if it exists
            default: break
            }
        case 1: // Location Section
            switch indexPath.row {
            case 0:
                cell.setTitle("Building Information")
            default: break
            }
            
        case 2: // Profile Section
            switch indexPath.row {
            case 0:
                cell.setTitle("Username")
                let username = getUsername()
                cell.setButton(username ?? cell.noUsernameMsg)
            default: break
            }
            
        default: break
        }
        
        // Give cell access to VC
        cell.vc = self
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}