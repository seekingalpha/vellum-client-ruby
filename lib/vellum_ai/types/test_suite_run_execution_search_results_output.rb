# frozen_string_literal: true

require_relative "search_result"
require "json"

module Vellum
  class TestSuiteRunExecutionSearchResultsOutput
    attr_reader :output_variable_id, :value, :additional_properties

    # @param output_variable_id [String]
    # @param value [Array<SearchResult>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunExecutionSearchResultsOutput]
    def initialize(output_variable_id:, value: nil, additional_properties: nil)
      # @type [String]
      @output_variable_id = output_variable_id
      # @type [Array<SearchResult>]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunExecutionSearchResultsOutput
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunExecutionSearchResultsOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      output_variable_id = struct.output_variable_id
      value = parsed_json["value"].map do |v|
        v = v.to_json
        SearchResult.from_json(json_object: v)
      end
      new(output_variable_id: output_variable_id, value: value, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunExecutionSearchResultsOutput to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "output_variable_id": @output_variable_id, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.output_variable_id.is_a?(String) != false || raise("Passed value for field obj.output_variable_id is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
