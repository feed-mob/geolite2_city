require "bundler/gem_tasks"
require "rake/testtask"
require "zlib"
require "fileutils"
require "rubygems/package"
require "net/http"
require "uri"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

desc "Update the DB and the Gem version"
namespace :db do
  task :update do
    uri = URI("http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz")
    tarball = Net::HTTP.get(uri)
    z = Zlib::GzipReader.new(StringIO.new(tarball))
    unzipped = StringIO.new(z.read)

    gem_version = nil

    Gem::Package::TarReader.new(unzipped) do |tar|
      tar.each do |tarfile|
        if tarfile.directory?
          _prefix, file_version = tarfile.full_name.split("_", 2)
          gem_version = [ file_version[0,4], file_version[4,2], file_version[6,2] ].join(".")

          File.write(File.join(__dir__, "db", "VERSION"), gem_version)

          next
        end

        filename = File.basename(tarfile.full_name)
        File.binwrite(File.join(__dir__, "db", filename), tarfile.read)
      end
    end

    puts "Done! Version: #{gem_version}"
  end
end

task :default => :test
