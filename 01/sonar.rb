#!/usr/bin/env ruby
# frozen_string_literal: true

if $PROGRAM_NAME == __FILE__
  simple_count = 0
  window_count = 0
  window = []
  WINDOW_SIZE = 3
  simple_previous = nil
  window_previous = nil
  ARGF.each_line do |line|
    depth = Integer(line)

    simple_count += 1 if simple_previous && depth > simple_previous
    simple_previous = depth

    window.push(depth)
    next unless window.count == WINDOW_SIZE

    window_depth = window.sum
    window_count += 1 if window_previous && window_depth > window_previous
    window_previous = window_depth
    window.shift
  end
  puts simple_count
  puts window_count
end
