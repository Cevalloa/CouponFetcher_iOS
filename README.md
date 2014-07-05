## Software Engineer - iOS / Code Test ##

[ZipfWorks](http://www.zipfworks.com/) is currently seeking an iOS software engineer. This repository contains code test instructions for our engineering candidates. More information about our company and the position are available at our [Stack Overflow careers page](http://careers.stackoverflow.com/jobs/59174/ios-mobile-engineer-social-shopping-apps-zipfworks).

### Introduction ###

We are looking for a candidate to work on our apps, starting with an update to [StyleSpotter for iPad](https://itunes.apple.com/us/app/stylespotter-fashion-shopping/id734464760?mt=8).

### Requirements ###

Your mission is to write an app with the following screens 

![](design/coupons.png) ![](design/login.png)

Use the [design](design) folder for guidance, we would like you to focus on how the app works

1. Coupons
  - Show coupons from our REST API
  - Resource: `http://api.bluepromocode.com/v2/promotions`
  - Method: `GET` 

2. Login
  - Login using our REST API
  - Resource: `http://api.bluepromocode.com/v2/users/login`
  - Method: `POST` 
  - JSON Encoded Parameters: `email`, `password`
  - We have a test account you can use: email: `a@a.com`, password: `12345678`

3. Bonus: Signup
  - Signup using our REST API
  - Resource: `http://api.bluepromocode.com/v2/users/register`
  - Method: `POST` 
  - JSON Encoded Parameters: `fullName`, `email`, `password` 
	 
4. Bonus: Personalized Coupons 
  - Show personalized coupons from our REST API (requires authentication)
  - Resource: `http://api.bluepromocode.com/v2/users/self/promotions/suggestions`
  - Method: `GET` 

### Submitting Your Code ###

1. Clone this [GitHub repository](https://github.com/zipfworks/ios-code-test).
2. Add all relevant project files and a README with the steps necessary for us to run your code.
3. Send a link to a new repository or a zip file of the completed test to engineering@zipfworks.com.

### Notes ###

* You're welcome to use any framework(s) of your choosing for this project (we're using [AFNetworking](http://afnetworking.com/)).
* If you have any questions, please feel free to email us at engineering@zipfworks.com.
