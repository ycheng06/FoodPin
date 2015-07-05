//
//  NewRestaurantTableViewController.swift
//  FoodPin
//
//  Created by Jason Cheng on 7/5/15.
//  Copyright (c) 2015 Jason. All rights reserved.
//

import UIKit

class NewRestaurantTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var isVisited:Bool = false
    
    // Save new restaurant
    @IBAction func saveNewRestaurant(sender: AnyObject) {
        var errorMessage:String = "We can't proceed as you forgot to fill in the"
        var hasError:Bool = false
        
        if nameTextField.text == "" {
            errorMessage += "restaurant name"
            hasError = true
        }
        else if typeTextField.text == "" {
            errorMessage += "restaurant type"
            hasError = true
        }
        else if locationTextField.text == "" {
            errorMessage += "restaurant location"
            hasError = true
        }
        
        if hasError {
            // Display alert popup
            let validationAlert = UIAlertController(title: "Oops",
                message: errorMessage, preferredStyle: .Alert)
        
            let okAction = UIAlertAction(title: "OK",
                style: UIAlertActionStyle.Cancel, handler: nil)
            validationAlert.addAction(okAction)
        
            self.presentViewController(validationAlert, animated: true, completion: nil)
        }
        else {
            // Save restaurant and return home page
            
            performSegueWithIdentifier("unwindToHomeScreen", sender: nil)
        }
    }
    
    @IBAction func hasVisited(sender: AnyObject) {
        self.isVisited = true
        
        // Update the button color
        yesButton.backgroundColor = UIColor.redColor()
        noButton.backgroundColor = UIColor.grayColor()
    }
    
    @IBAction func hasntVisited(sender: AnyObject) {
        self.isVisited = false
        yesButton.backgroundColor = UIColor.grayColor()
        noButton.backgroundColor = UIColor.redColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if self.isVisited {
            yesButton.backgroundColor = UIColor.redColor()
            noButton.backgroundColor = UIColor.grayColor()
        }
        else {
            yesButton.backgroundColor = UIColor.grayColor()
            noButton.backgroundColor = UIColor.redColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imgPicker = UIImagePickerController()
                imgPicker.delegate = self
                imgPicker.allowsEditing = false
                imgPicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imgPicker, animated: true, completion: nil)
            }
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        // Get the image chosen in photolibrary and assign to image view
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//    func navigationController(navigationController: UINavigationController!, willShowViewController viewController: UIViewController!, animated: Bool) {
//        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
//    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
