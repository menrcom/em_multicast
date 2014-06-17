#!/usr/bin/env ruby
# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
require './MulticastClient'
require './Application'

def work(num)
  puts "Worker №#{num}"
  Application.new().run(MulticastClient, ARGV[0] || "Hello thread №#{num}")
end

workers = Array.new

(1..10).each do |num|
  pid = fork
  if pid
    workers << pid
  else
    work(num)
    Process.exit(0)
  end
end

workers.each do |pid|
  Process.wait(pid)
end
