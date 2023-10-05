# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    # puts tsv.class
    # puts tsv
    tsv_data = tsv.split("\n")
    header, *data = tsv_data.map { |row| row.split("\t") }
    @data = data.map { |row| header.zip(row).to_h }
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    tsv = []
    tsv << @data[0].keys.join("\t")
    @data.each{ |item| tsv << item.values.join("\t") }
    "#{tsv.join("\n")}\n"
  end
end
