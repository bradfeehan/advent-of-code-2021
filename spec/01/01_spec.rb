# frozen_string_literal: true

RSpec.describe 'Day 01' do
  let(:day) { Day.new(1) }
  let(:script) { day.script('sonar') }

  subject(:stdout) { `#{script} #{input_file}` }

  describe 'first line' do
    subject(:first_line) { stdout.lines[0].chomp }

    context 'with example input' do
      let(:input_file) { day.fixture }
      it { is_expected.to eq '7' }
    end

    context 'with real input' do
      let(:input_file) { day.input }
      it { is_expected.to eq '1475' }
    end
  end

  describe 'second line' do
    subject(:second_line) { stdout.lines[1].chomp }

    context 'with example input' do
      let(:input_file) { day.fixture }
      it { is_expected.to eq '5' }
    end

    context 'with real input' do
      let(:input_file) { day.input }
      it { is_expected.to eq '1516' }
    end
  end
end
