# frozen_string_literal: true

module Etm
  module Services
    class Serializer
      attr_reader :downloader
      def initialize(downloader)
        @downloader = downloader
      end

      def route_params
        @route_params ||= sequences.map do |sequence|
          route = route_repository.find_by_id(sequence[:route_id])
          node_time = node_times_repository.find_by_id(sequence[:node_time_id])
          create_route_param(route, node_time)
        end.compact
      end

      private

      def route_repository
        @route_repository ||= Etm::Repository::Route.new(downloader)
      end

      def node_times_repository
        @node_times_repository ||= Etm::Repository::NodeTime.new(downloader)
      end

      def sequences_repository
        @sequences_repository ||= Etm::Repository::Sequence.new(downloader)
      end

      def sequences
        @sequences ||= sequences_repository.all
      end

      # rubocop:disable Metrics/MethodLength
      def create_route_param(route, node_time)
        return if route.nil? || node_time.nil?

        Etm::Entity::RouteParamEntity.new(
          passphrase: downloader.terminal.passphrase,
          start_time: route[:time],
          end_time: end_time(
            route[:time],
            node_time[:duration_in_milliseconds]
          ),
          start_node: node_time[:start_node],
          end_node: node_time[:end_node]
        )
      end
      # rubocop:enable Metrics/MethodLength

      def end_time(time, mill_sec)
        result = Time.parse(time) + (mill_sec / 1000).to_i
        result.strftime('%Y-%m-%dT%H:%M:%S')
      end
    end
  end
end
