#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require './MulticastServer'
require './Application'

Application.new(65535).run(MulticastServer)
