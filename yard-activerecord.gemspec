# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: yard-activerecord 0.0.14 ruby lib

Gem::Specification.new do |s|
  s.name = "yard-activerecord"
  s.version = "0.0.14"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Theodor Tonum"]
  s.date = "2014-11-17"
  s.description = "\n    YARD-Activerecord is a YARD extension that handles and interprets methods\n    used when developing applications with ActiveRecord. The extension handles\n    attributes, associations, delegates and scopes. A must for any Rails app\n    using YARD as documentation plugin. "
  s.email = "theodor@tonum.no"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".ruby-version",
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/yard-activerecord.rb",
    "lib/yard-activerecord/associations/base.rb",
    "lib/yard-activerecord/associations/belongs_to_handler.rb",
    "lib/yard-activerecord/associations/has_and_belongs_to_many_handler.rb",
    "lib/yard-activerecord/associations/has_many_handler.rb",
    "lib/yard-activerecord/associations/has_one_handler.rb",
    "lib/yard-activerecord/associations/plural_handler.rb",
    "lib/yard-activerecord/associations/singular_handler.rb",
    "lib/yard-activerecord/delegations/delegate_handler.rb",
    "lib/yard-activerecord/fields/create_table_handler.rb",
    "lib/yard-activerecord/fields/define_handler.rb",
    "lib/yard-activerecord/fields/enum_handler.rb",
    "lib/yard-activerecord/fields/field_handler.rb",
    "lib/yard-activerecord/fields/jsonb_handler.rb",
    "lib/yard-activerecord/scopes/scope_handler.rb",
    "lib/yard-activerecord/tags/active_attribute.rb",
    "lib/yard-activerecord/validations/validates_handler.rb",
    "lib/yard-activerecord/version.rb",
    "templates/default/tags/html/validations.erb",
    "templates/default/tags/setup.rb",
    "templates/default/tags/text/validations.erb",
    "yard-activerecord.gemspec"
  ]
  s.homepage = "https://github.com/theodorton/yard-activerecord"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "ActiveRecord Handlers for YARD"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<yard>, [">= 0.8.3"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<yard>, [">= 0.8.3"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0.8.3"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

