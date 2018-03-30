# Scowl

Adds/manipulates pessimization options in your gemfile. Sorta like the pessimize
gem but more configurable, but by default only adds pessimization options to
un-pessimized gems. (For example if you have a gem 'foo', '~> 4.1' and you run
scowl -n to lock everything to Major.minor.micro, scowl will NOT alter the
pessimization for the foo gem. You can override this with options.)

## Installation

Scowl is generally meant to be a developer-side tool so you probably don't need
to add it to your applications Gemfile or your gem's gemspec file. You probably
just want to

    $ gem install scowl

And then execute:

    $ scowl -h

To see all the wonderful options.

## Usage

    $ scowl [options] [<gem> [<gem> [...]]]

Options:

* `-h`, `--help` - Show help message
* `-p`, `--pretend` - Run scowl and emit its changes as a list of recommendations, but don't actually change things
* `-m`, `--major` - Pessimize to major version, e.g. '~> 4.1', which locks major version but allows minor version to change
* `-n`, `--minor` - Pessimize to minor version, e.g. '~> 4.1.3', which locks minor version but allows micro version to change
* `-t`, `--tighten` - Change existing pessimizations, but only if they would be tightened (only makes sense with `--minor`)
* `-o`, `--override` - Set all pessimizations, even if they are already set and would be loosened
* `-x`, `--exclude` - Exclude gem(s) (May be passed multiple times or pass comma-separated list, e.g. `--exclude=foo,bar,baz`
* `-0`, `--nonsemantic-zero` - Tighten versions one level tighter if gem version begins with a zero (See note)

If gem names are specified, ONLY those gems will be checked/modified.

## Nonsemantic Zero

Many gems do not adhere to semantic versioning while they are still in version zero, even if they are very old and fairly stable. An ad-hoc standard has emerged to allow breaking changes in 0.minor version changes and lump new features and bug fixes together in micro version changes. If you use `--nonsemantic-zero` with `--major`, scowl will pessimize gems still in version 0 to `--minor` automatically.

## TODO-Driven Development
* [ ] Initial spike
  * [ ] Read the Gemfile and get list of gem specifications
  * [ ] Run bundle exec gem list to get list of installed gems
  * [ ] Detect existing pessimizations and version locks (e.g. `= 4.3.1` and `> 4.5`)
  * [ ] Emit Gemfile with new pessimizations added
* [ ] Support tighten
  * [ ] Detect existing pessimization level
  * [ ] Know if specified level is tighter than existing level, e.g. `--minor` is tighter than `~> 4.1`, `--major` is tighter than `~> 4`
* [ ] Can/should we parse into gemspec? For now, assume no.
* [ ] Don't mess up other options, e.g. `source` and `require` options
* [ ] Implement nonsemantic zero support
* [ ] Support named list of gems
* [ ] Support excluded gems
* [ ] Weird test/edge cases
  * [ ] Handle useless pessimization? E.g. Treat `~> 4`, which is essentially identical to `>= 4`, as tightening (don't set to major or minor unless `--tighten` specified)


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Please help! Pull requests from new contributors very welcome! Please contact
@dbrady if you want to make a large change, otherwise please just make sure your
pull request says what your change fixes/adds and your specs demonstrate the fix
or document the feature.

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/scowl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
