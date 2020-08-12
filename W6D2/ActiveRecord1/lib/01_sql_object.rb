require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns 
    column_names = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
      LIMIT
        0
    SQL
    @columns = column_names.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|
      define_method("#{column}") do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
       self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    # str = self.to_s
    # new_str = ""
    # if str.split(" ").length < 2
    #   table_name = str.downcase
    # else
    #   new_str += str[0]
    #   str[1..-1].each_char do |char|
    #     if char = char.upcase
    #       new_str += ('_' + char)
    #     else
    #       new_str += char
    #     end
    #   end
    #   new_str + 's'
    # end
    # table_name = new_str.downcase
    @table_name = table_name
  end

  def self.table_name
    # str = self.to_s
    # new_str = ""
    # if str.split(" ").length < 2
    #   return str.downcase + 's'
    # else
    #   new_str += str[0]
    #   str[1..-1].each_char do |char|
    #     if char = char.upcase
    #       new_str += ('_' + char)
    #     else
    #       new_str += char
    #     end
    #   end
    #   new_str + 's'
    # end
    # new_str.downcase

    @table_name || self.name.tableize
  end

  def self.all
    hashes = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    parse_all(hashes)
  end

  def self.parse_all(results)
    result = results.map {|ele| self.new(ele)}
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL
    return nil unless result.length >= 1
    a = result.map {|ele| self.new(ele)}
    a.first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      if self.class.columns.include?(attr_name.to_sym)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values

  end

  def insert
    col_names = self.columns.join(",")
    question_marks = (["?"] * self.columns.length).join(",")
    DBConnection.execute(<<-SQL, )
      INSERT INTO
        #{self.table_name} #{col_names}
      VALUES
        #{question_marks}
    SQL
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
