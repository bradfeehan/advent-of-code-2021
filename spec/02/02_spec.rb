# frozen_string_literal: true

RSpec.describe 'Day 02' do
  let(:day) { Day.new(2) }
  let(:script) { day.script('submarine') }

  subject(:stdout) { `#{script} #{input_file}` }

  describe 'first line' do
    subject(:first_line) { stdout.lines[0].chomp }

    context 'with example input' do
      let(:input_file) { day.fixture }
      it { is_expected.to include 'depth = 10' }
      it { is_expected.to include 'position = 15' }
      it { is_expected.to include 'total = 150' }
    end

    context 'with real input' do
      let(:input_file) { day.input }
      it { is_expected.to include 'depth = 951' }
      it { is_expected.to include 'position = 1980' }
      it { is_expected.to include 'total = 1882980' }
    end
  end

  describe 'second line' do
    subject(:second_line) { stdout.lines[1].chomp }

    context 'with example input' do
      let(:input_file) { day.fixture }
      it { is_expected.to include 'depth = 60' }
      it { is_expected.to include 'position = 15' }
      it { is_expected.to include 'total = 900' }
    end

    context 'with real input' do
      let(:input_file) { day.input }
      it { is_expected.to include 'depth = 995572' }
      it { is_expected.to include 'position = 1980' }
      it { is_expected.to include 'total = 1971232560' }
    end
  end
end
