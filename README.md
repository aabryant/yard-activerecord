# YARD ActiveRecord Plugin

[![Version](http://img.shields.io/gem/v/yard-activerecord.svg?style=flat-square)](https://rubygems.org/gems/yard-activerecord)
[![Downloads](http://img.shields.io/gem/dt/yard-activerecord.svg?style=flat-square)](https://rubygems.org/gems/yard-activerecord)
[![Open Github issues](http://img.shields.io/github/issues/theodorton/yard-activerecord.svg?style=flat-square)](https://github.com/theodorton/yard-activerecord/issues)

A YARD extension that handles and interprets methods used when developing
applications with ActiveRecord. The extension handles attributes,
associations, delegates and scopes. A must for any Rails app using YARD as
documentation plugin.


## Installation

Run the following command in order to load YARD plugins:

```
$ yard config load_plugins true
```

## Attributes

In order for this plugin to document any database attributes you need to add
`schema.rb` to your list of files. This is preferably done with in `.yardopts`
within your app project folder:

```
# .yardopts
'app/**/*.rb'
'db/schema.rb'
```

It's important that the `schema.rb`-file is added at the end as it needs all
classes loaded before it can add the attributes.

The plugin will then document all attributes in your documentation.

All attributes will be marked as writable. I will update the plugin to include
handling of `attr_accessible` at a later point.

There is an issue with namespaced classes. Currently this plugin will try and
fetch a class with a namespace if it does not find one at the first try.

Example:

    Table name        Class name
    sales_people      SalesPeople # does not exist
    sales_people      Sales::People # does exist

A problem then emerges if you have namespaces with two names.

Example:

    Table name          Class name
    sales_force_people  SalesForcePeople # does not exist
    sales_force_people  Sales::ForcePeople # does not exist

The documentation will then be skipped for this table/class.

## Associations

The plugin handles `has_one`, `belongs_to`, `has_many` and
`has_and_belongs_to_many` associations. The annotation for each association
includes a link to the referred model. For associations with a list of objects
the documentation will simply be marked as `ActiveRecord::Relation<ModelName>`.

## Delegates

The plugin handles `delegate`-methods and marks these delegated instance
methods simply as aliases for the associated object.

## Scopes

The plugin will add class methods for any scopes you have defined in your
models.

## Tags

The `@!active_attribute` tag has been added. You can treat this exactly the same
way as you would the `@!attribute` tag, but it won't overwrite the status of a
field as belonging to the database and is compatible with `enum` and
`jsonb_accessor` definitions.

## enum and jsonb_accessor

Both `enum` and `jsonb_accessor` have been given simple handling and possess
their own groups. Their definition blocks will be displayed in their
descriptions.

## Validations ##

The plugin will add information about validations onto each field.  It only handles
the new style validations in the form of:

    validates :foo, :presence=>true, :length=>{ is: 6 }

Validations in the older form of:

    validates_presence_of :foo

are not supported.

## Other useful plugins

Check out:

  * [https://github.com/ogeidix/yard-rails-plugin](https://github.com/ogeidix/yard-rails-plugin)


## Contributing to yard-activerecord

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.


## Copyright

Copyright (c) 2014 Theodor Tonum. See LICENSE.txt for
further details.

