# SCSS Lint Custom
A custom lint for scss_lint.

## Getting Started
Install all dependencies as normal
```
$ bundle install
```

Execute tests as you develop with
```
$ guard
```

Before submitting a PR run all tests with
```
$ rspec spec/
```

And make sure you comply with the community style guide by running
```
$ rubocop
```

You can run a console for an interactive prompt that will allow you
to experiment.
```
$ bin/console
```


## Installation
Add it to your Gemfile
```ruby
gem 'scss_lint', require: false
gem 'scss_lint_custom', github: 'AdvancetoGO/SCSSLint-Custom'
```


## Usage
Add the following to your `.scss-lint.yml`:

```yaml
plugin_gems: ['scss_lint_custom']

linters:
  LineLength:
    enabled: true
  RedundantNewline:
    enabled: true
```

Then run `scss-lint` to see if there are offenses.


## Project Structure

* `.scss-lint.yml` - Default parameters for the linters.
* `lib/scss_lint_custom.rb` - Entry point for the extension, with all requires.
* `lib/scss_lint_custom/scss_lint/linter/*` - Custom linters definitions.

## Contributing
We use Github Flow, you can read more about it on these pages

https://guides.github.com/introduction/flow/

http://scottchacon.com/2011/08/31/github-flow.html


The process is as follows:

Create your feature branch
```
$ git checkout -b my-new-feature
```

Commit your changes
```
$ git commit -am 'Add some feature'
```

Push to the branch
```
$ git push origin my-new-feature
```

Create a new Pull Request
