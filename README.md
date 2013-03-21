# SimpleGoogleCustomSearch (Forked from https://github.com/cherwei/simple_google_custom_search)

With Simple Google Custom Search, help people search what they need in your website just like in official google site.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_google_custom_search'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_google_custom_search

## Configuration

You need to define a <tt>constant variable</tt> for the API to search the matching words to your domain:

    SGCS_CONFIG = {
        domain: 'YOUR_SITE_URL'
    }

## Usage

To perform a search:

    results = SimpleGoogleCustomSearch.search("simple", page_number)

The +results+ variable is now a SimpleGoogleCustomSearch::ResultSet object:

    results.total            # number of results (integer)
    results.item             # array of result objects (SimpleGoogleCustomSearch::Result)
    results.total_pages      # total number of pages returned

Iterate through the results:

    results.item.each do |result|
        result.title           # result title
        result.link            # result URL
        result.description     # excerpt, with terms highlighted
    end
    
Show pagination links:
    
    sgcs_paginate(results)      # renders pagination links 10 pages at a time

## TODO

1. Unit Test

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
