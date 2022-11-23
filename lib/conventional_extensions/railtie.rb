class ConventionalExtensions::Railtie < Rails::Railtie
  initializer "conventional_extensions.ignore_extensions_directories" do
    Rails.autoloaders.main.ignore "**/extensions/**.rb"
  end
end
