# Copyright 2015 Google
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
require 'date'

class Formatter
  def self.format value, type
    return unless value
    send "format_#{type}", value
  end

  def self.format_boolean value
    case value.to_s
    when /1/, /[Tt]rue/, /[Tt]/
      true
    when /0/, /[Ff]alse/, /[Ff]/
      false
    else
      raise "cannot coerce #{value} into boolean"
    end
  end

  def self.format_string value
    value.to_s
  end

  def self.format_integer value
    value.to_i
  end

  def self.format_id value
    value.gsub(/['"\\]/, '')
  end

  def self.format_float value
    value.to_f
  end

  def self.format_timestamp value
    DateTime.parse(value).rfc3339
  end
end

require 'csv'
require_relative 'columns'

filename, outfile, * = ARGV

abort "Specify outfile" unless outfile

CSV.open(filename, "r:UTF-8", headers: true) do |input|
  CSV.open(outfile, "wb:UTF-8") do |output|

    input.shift          # read the headers
    headers = input.headers

    output << headers

    input.each do |line|
      new_line = []
      line.each do |col_name, value|
        new_line << Formatter.format(value, PROJECTS_COLUMNS[col_name])
      end

      output << new_line

    end
  end
end