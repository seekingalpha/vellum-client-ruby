# frozen_string_literal: true

require "json"
require_relative "execution_string_vellum_value"
require_relative "execution_number_vellum_value"
require_relative "execution_json_vellum_value"
require_relative "execution_chat_history_vellum_value"
require_relative "execution_search_results_vellum_value"
require_relative "execution_error_vellum_value"
require_relative "execution_array_vellum_value"
require_relative "execution_function_call_vellum_value"

module Vellum
  class ExecutionVellumValue
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [ExecutionVellumValue]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ExecutionVellumValue
    #
    # @param json_object [JSON]
    # @return [ExecutionVellumValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 ExecutionStringVellumValue.from_json(json_object: json_object)
               when "NUMBER"
                 ExecutionNumberVellumValue.from_json(json_object: json_object)
               when "JSON"
                 ExecutionJsonVellumValue.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 ExecutionChatHistoryVellumValue.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 ExecutionSearchResultsVellumValue.from_json(json_object: json_object)
               when "ERROR"
                 ExecutionErrorVellumValue.from_json(json_object: json_object)
               when "ARRAY"
                 ExecutionArrayVellumValue.from_json(json_object: json_object)
               when "FUNCTION_CALL"
                 ExecutionFunctionCallVellumValue.from_json(json_object: json_object)
               else
                 ExecutionStringVellumValue.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
      case @discriminant
      when "STRING"
        { **@member.to_json, type: @discriminant }.to_json
      when "NUMBER"
        { **@member.to_json, type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, type: @discriminant }.to_json
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "SEARCH_RESULTS"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "STRING"
        ExecutionStringVellumValue.validate_raw(obj: obj)
      when "NUMBER"
        ExecutionNumberVellumValue.validate_raw(obj: obj)
      when "JSON"
        ExecutionJsonVellumValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        ExecutionChatHistoryVellumValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        ExecutionSearchResultsVellumValue.validate_raw(obj: obj)
      when "ERROR"
        ExecutionErrorVellumValue.validate_raw(obj: obj)
      when "ARRAY"
        ExecutionArrayVellumValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        ExecutionFunctionCallVellumValue.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [ExecutionStringVellumValue]
    # @return [ExecutionVellumValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [ExecutionNumberVellumValue]
    # @return [ExecutionVellumValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [ExecutionJsonVellumValue]
    # @return [ExecutionVellumValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [ExecutionChatHistoryVellumValue]
    # @return [ExecutionVellumValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [ExecutionSearchResultsVellumValue]
    # @return [ExecutionVellumValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [ExecutionErrorVellumValue]
    # @return [ExecutionVellumValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end

    # @param member [ExecutionArrayVellumValue]
    # @return [ExecutionVellumValue]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end

    # @param member [ExecutionFunctionCallVellumValue]
    # @return [ExecutionVellumValue]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
  end
end
