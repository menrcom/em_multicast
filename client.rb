#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require './MulticastClient'
require './Application'

Application.new().run(MulticastClient, ARGV[0] || "Hello!")
