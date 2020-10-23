require "jpfs/version"
require "geokit"

module Jpfs
  class Error < StandardError; end

  class Prefecture
    attr_reader :id, :english, :japanese

    def contains?(point)
      @polygons.any? {|polygon| polygon.contains?(point) }
    end

    def inspect
      "#<#{self.class} @id=#{id} @english=#{english.inspect} @japanese=#{japanese.inspect}>"
    end

    def self.from(feature)
      properties = feature.fetch('properties')
      id         = properties.fetch('id')
      english    = properties.fetch('nam')
      japanese   = properties.fetch('nam_ja')

      geometry    = feature.fetch('geometry')
      coordinates = geometry.fetch('coordinates')
      coordinates = [coordinates] if geometry.fetch('type') == 'Polygon'
      polygons    = coordinates.map do |lines|
        points = lines[0].map { |point| Geokit::LatLng.new(point[1], point[0]) }
        Geokit::Polygon.new(points)
      end

      new(id: id, english: english, japanese: japanese, polygons: polygons)
    end

    private

    def initialize(id:, english:, japanese:, polygons:)
      @id       = id
      @english  = english
      @japanese = japanese
      @polygons = polygons
    end
  end

  def self.search(longitude:, latitude:)
    PREFECTURES.find do |prefecture|
      point = Geokit::LatLng.new(latitude, longitude)

      prefecture.contains?(point)
    end
  end

  GEOJSON_PATH = "#{__dir__}/../data/japan.geojson"

  PREFECTURES = begin
                  features = File.open(GEOJSON_PATH) { |io| JSON.load(io) }.fetch('features')
                  features.map {|feature| Prefecture.from(feature) }
                end
end
