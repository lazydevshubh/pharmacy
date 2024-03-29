# Pharmeasy
Web-shop for online Medicine shopping

##Features
* Customers can list and view products
* Customers can register account
* Only registered customers can order

* Admin can login to do the following works in a different interface:
    * Add products
    * Views orders

* Database store
    * Products information
    * Customer information
    * Orders information
    * Administrator information

##Requirements
* Node.js with the following modules
    * body-parser: ~1.13.2
    * cookie-parser: ~1.3.5
    * debug: ~2.2.0
    * express: ~4.13.1
    * jade: ~1.11.0
    * morgan: ~1.6.1
    * serve-favicon: ~2.3.0
    * mysql: ~2.9.0
    * passport: ~0.3.2
    * slugify: ~0.1.1

##Installation
* Clone project: `git clone https://github.com/lazydevshubh/pharmacy.git`
* Install dependencies in `package.json`: `npm install`

##Usage
* Run the pharmeasy.sql to create the database and make sure sql server is running.
* Execute `node bin/www.js` from project directory
* Then open `localhost:3000`
![Screenshot of the website](https://github.com/lazydevshubh/pharmacy/raw/master/Screenshot-main.png)
