# frozen_string_literal: true

require_relative "function_call"
require "json"

module Vellum
  class NodeInputCompiledFunctionCall
    attr_reader :node_input_id, :key, :value, :additional_properties

    # @param node_input_id [String]
    # @param key [String]
    # @param value [FunctionCall]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [NodeInputCompiledFunctionCall]
    def initialize(node_input_id:, key:, value: nil, additional_properties: nil)
      # @type [String]
      @node_input_id = node_input_id
      # @type [String]
      @key = key
      # @type [FunctionCall]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of NodeInputCompiledFunctionCall
    #
    # @param json_object [JSON]
    # @return [NodeInputCompiledFunctionCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      node_input_id = struct.node_input_id
      key = struct.key
      if parsed_json["value"].nil?
        value = nil
      else
        value = parsed_json["value"].to_json
        value = FunctionCall.from_json(json_object: value)
      end
      new(node_input_id: node_input_id, key: key, value: value, additional_properties: struct)
    end

    # Serialize an instance of NodeInputCompiledFunctionCall to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "node_input_id": @node_input_id, "key": @key, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.node_input_id.is_a?(String) != false || raise("Passed value for field obj.node_input_id is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.value.nil? || FunctionCall.validate_raw(obj: obj.value)
    end
  end
end
