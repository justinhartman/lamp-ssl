# frozen_string_literal: true
require 'codecov'
require 'simplecov'

SimpleCov.formatter = Codecov::SimpleCov::Formatter
SimpleCov.add_group "Bash Scripts", '\.sh$'
SimpleCov.add_group "Nested scripts", "/nested"
SimpleCov.add_filter '.git'
# SimpleCov.add_filter 'src'
