## Login Screen
<img src="https://user-images.githubusercontent.com/19978447/28882356-9ef55c7c-77c8-11e7-8359-64542eaede79.png" width="250" height="400">


From this screen user can register and login to this app, for the user authentication i used firbase authentication

## Login with Google 

<img src="https://user-images.githubusercontent.com/19978447/28882386-b5220964-77c8-11e7-87c1-f60bbff5ba45.png" width="250" height="400">

From this screen user can register and login to this app, for the user authentication i used firbase authentication

## Medicine Details 

<img src="https://user-images.githubusercontent.com/19978447/28882498-0b5bc2de-77c9-11e7-8d9f-e4e2bc127c69.png" width="250" height="400">


## Menu Items

<img src="https://user-images.githubusercontent.com/19978447/28882575-434a1114-77c9-11e7-9e6a-31b0ea239ec3.png" width="250" height="400">


## Notification Scheduling

<img src="https://user-images.githubusercontent.com/19978447/28882641-6fe5e0d6-77c9-11e7-9105-d0076a1e71fc.png" width="250" height="400">


## List of Medicine 

<img src="https://user-images.githubusercontent.com/19978447/28882688-a10592e2-77c9-11e7-96a9-48419b9e7d88.png" width="250" height="400">

From this screen user can search a medicine and alsocan Edit and Update the medicine by clicking on medicine


## Edit Medicine 

<img src="https://user-images.githubusercontent.com/19978447/28885293-088bcaae-77d3-11e7-827c-2227a3b28b2a.png" width="250" height="400">

Search medicine and update

## Edit Medicine 

<img src="https://user-images.githubusercontent.com/19978447/28882837-0fb38640-77ca-11e7-916f-d8014485ddc9.png" width="250" height="400">


## Settings 

<img src="https://user-images.githubusercontent.com/19978447/28885479-aab36f8a-77d3-11e7-88cd-045a09dce82c.png" width="250" height="400">

## Add user Details 

<img src="https://user-images.githubusercontent.com/19978447/28885586-0be9017a-77d4-11e7-8a23-e7cd7b7c144e.png" width="250" height="400">


## Add Medicine Details 

<img src="https://user-images.githubusercontent.com/19978447/28885658-4a8ce900-77d4-11e7-9b45-e2d4a6538f82.png" width="250" height="400">


## Add Emergency Doctor mobile 

<img src="https://user-images.githubusercontent.com/19978447/28885720-7eccc0b4-77d4-11e7-808b-fcf5c1f3299a.png" width="250" height="400">




Features:

The app has three tabs at the bottom for navigation just like Instagram.
Tab 1 : This tab will consist of list of medicine that the user will have to take today. (Name, dose of the medicine and the time when the medicine has to be taken)
Tab 2 : This will consist of all the medicine list that the user usually takes. User should be able to click on the item and update the medicine details. There must be a "Search bar" in the action bar for this tab. Note that the search bar should not available in other tabs.
Tab 3 : This is the user accounts page. This tab will consist of the following
     A. User detail card (name and age) - On click of this tab, the user should be able to edit the details.
     B. Add new medicine. (Medicine that is already added should not be added again). User should add the following details of the medicines.
            - Medicine name
            - Dose frequency (daily / weekly)
            - Quantity (of medicine at a time)
            - Number of dose per day
            - Reminder settings ( set the time when the app should remind the users. If the medicine has to be taken twice a day, user should set two reminders for that medicine)
            - Number of medicines purchased
            - Before saving the details, show a popup asking user to check expiry date of medicine.
     C. SOS settings page. User will be allowed to add one number and name that will be used incase of emergency.
Apart from these three tabs, there will be a SOS button on the top right, which on click, will make a call to the predefined number in SOS setting.

The app should send notifications for reminders in notification bar and it will consist of the medicine name and the dose

USER FLOW : 

First Time USer:
 Ask for user's name and age. On successful entry and on press of OK button, take the user to the SOS entry page. Ask for SOS name and SOS number. On click of ok, take user to home screen. Focus on Tab 1

Existing User:

On open of app, take user to the home screen with focus on Tab 1 which has the list of medicines to be taken today/ empty.  SOS will always be on top bar.
On click of tab 2 : show the list of all the medicines. User will be able to update medicine details by clicking individual medicine. Search bar and SOS on top action bar
On click of tab 3: Show account setting.
