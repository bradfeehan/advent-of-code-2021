#!/usr/bin/env ruby
# frozen_string_literal: true

module Day02
  # Represents the submarine from Day 2
  class Submarine
    attr_reader :depth, :position

    def initialize
      @depth = 0
      @position = 0
    end

    def forward(steps)
      @position += steps
    end

    def down(steps)
      @depth += steps
    end

    def up(steps)
      @depth -= steps
      validate_depth!
    end

    private

    def validate_depth!
      raise 'Negative depth' if @depth.negative?
    end
  end

  # The variant of the submarine from Day 2 which can aim up and down
  class AimingSubmarine < Submarine
    attr_reader :aim

    def initialize
      @aim = 0
      super
    end

    def forward(steps)
      super
      @depth += aim * steps
      validate_depth!
    end

    def down(steps)
      @aim += steps
    end

    def up(steps)
      @aim -= steps
    end
  end
end

if $PROGRAM_NAME == __FILE__
  sub1 = Day02::Submarine.new
  sub2 = Day02::AimingSubmarine.new

  ARGF.each_line do |line|
    operation, argument = line.split(' ', 2)
    steps = Integer(argument)
    sub1.public_send(operation, steps)
    sub2.public_send(operation, steps)
  end

  puts "sub 1: depth = #{sub1.depth}, position = #{sub1.position}, total = #{sub1.depth * sub1.position}"
  puts "sub 2: depth = #{sub2.depth}, position = #{sub2.position}, total = #{sub2.depth * sub2.position}"
end
