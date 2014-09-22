[![Gem Version](https://badge.fury.io/rb/yaleldap.svg)](http://badge.fury.io/rb/yaleldap)
[![Dependency Status](https://gemnasium.com/YaleSTC/yaleldap.svg)](https://gemnasium.com/YaleSTC/yaleldap)
[![Build Status](https://travis-ci.org/YaleSTC/yaleldap.svg?branch=testinghound)](https://travis-ci.org/YaleSTC/yaleldap)
[![Code Climate](https://codeclimate.com/github/YaleSTC/yaleldap/badges/gpa.svg)](https://codeclimate.com/github/YaleSTC/yaleldap)
[![Test Coverage](https://codeclimate.com/github/YaleSTC/yaleldap/badges/coverage.svg)](https://codeclimate.com/github/YaleSTC/yaleldap)
[![Inline docs](http://inch-ci.org/github/YaleSTC/yaleldap.png?branch=master)](http://inch-ci.org/github/YaleSTC/yaleldap)

# YaleLDAP

Offers the most common Yale LDAP search queries, returning a convenient ruby hash with names you can understand. Makes it easy to conserve your Yale users' time and energy, saving them from typing again and again that basic information they *know* mother Yale already has on record.

The LDAP server behaves differently depending on whether you are on Yale's network (on campus/VPN) or not. Some information (like name, upi) are available from anywhere, while other information (like netid, office phone number) are only available on Yale's network.

## Installation

Add this line to your application's Gemfile:

    gem 'yaleldap'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yaleldap

## Usage

###UPI
```
YaleLDAP.lookup(upi: "12714662")
=> {:first_name=>"Casey", :nickname=>"", :last_name=>"Watts", :upi=>"12714662", :netid=>"csw3", :email=>"casey.watts@yale.edu", :college_name=>"", :college_abbreviation=>"", :class_year=>"", :school=>"", :telephone=>"", :address=>"ITS Student Technology Collaborative\nPO BOX 208300\nNew Haven, CT 06520-8300"}
```

###NetID
```
YaleLDAP.lookup(netid: "csw3")
=> {:first_name=>"Casey", :nickname=>"", :last_name=>"Watts", :upi=>"12714662", :netid=>"csw3", :email=>"casey.watts@yale.edu", :college_name=>"", :college_abbreviation=>"", :class_year=>"", :school=>"", :telephone=>"", :address=>"ITS Student Technology Collaborative\nPO BOX 208300\nNew Haven, CT 06520-8300"}
```

###Email
```
YaleLDAP.lookup(email: "casey.watts@yale.edu")
=> {:first_name=>"Casey", :nickname=>"", :last_name=>"Watts", :upi=>"12714662", :netid=>"csw3", :email=>"casey.watts@yale.edu", :college_name=>"", :college_abbreviation=>"", :class_year=>"", :school=>"", :telephone=>"", :address=>"ITS Student Technology Collaborative\nPO BOX 208300\nNew Haven, CT 06520-8300"}
```


## Documentation
The source code is documented thoroughly, view it on [rdoc.info](http://rdoc.info/github/YaleSTC/yaleldap/master/frames)

For more background on how the `net-ldap` gem works with specific Yale examples, check out this [Yale net-ldap gist](https://gist.github.com/caseywatts/ddea3996853050d1e5ad).

## Contributing

1. Fork it ( http://github.com/YaleSTC/yaleldap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Development
1. You can load the file you're working on by opening irb and running `load "./lib/yaleldap.rb"` (from the directory this repo is in).
2. You can run our testing suite by running `bundle exec guard`, which uses guard-rspec to run our testing suite.
3. We use YARD for in-line documentation , to view the documentation locally run `yard` then open `docs/index.html` to view them.
4. Our testing suite is automatically run on Travis CI.

