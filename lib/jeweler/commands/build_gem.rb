class Jeweler
  module Commands
    class BuildGem
      attr_accessor :base_dir, :gemspec_helper, :file_utils

      def initialize
        self.file_utils = FileUtils
      end

      def run
        gemspec = gemspec_helper.parse
        gem_file_name = Gem::Builder.new(gemspec).build

        pkg_dir = File.join(base_dir, 'pkg')
        file_utils.mkdir_p pkg_dir

        gem_file_name = File.join(base_dir, gem_file_name)
        file_utils.mv gem_file_name, pkg_dir
      end
    end
  end
end
