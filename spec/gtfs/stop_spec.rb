require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GTFS::Stop do
  describe 'Trip.parse_models' do
    let(:header_line) {"stop_id,stop_code,stop_name,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station\n"}
    let(:invalid_header_line) {"stop_lon, zone_id, stop_url, location_type\n"}
    let(:valid_line) {"3,C093,LANIER & SINAI HOSPITAL,39.351145,-76.663113,,,,\n"}
    let(:invalid_line) {"3,,,,-76.663113,,,,\n"}

    subject {GTFS::Stop.parse_models(source_text, opts)}

    include_examples 'models'
  end

  describe 'GTFS::Stop.coordinates' do
    it 'converts stop_lon,stop_lat into float coordinates' do
      stop = GTFS::Stop.new({stop_lon: '4.56', stop_lat: '-12.3'})
      stop.coordinates.should eq([4.56, -12.3])
    end
  end
end
