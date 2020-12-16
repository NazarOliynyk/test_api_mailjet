require_relative 'yaml_loader'
module DataManager

  def data
    Tools::YamlLoader.read_yaml(replace_path)
  end

  def author_data
    Tools::YamlLoader.read_yaml('features/backend/test_data/author.yml')
  end

  def genre_data
    Tools::YamlLoader.read_yaml('features/backend/test_data/genre.yml')
  end

  def book_data
    Tools::YamlLoader.read_yaml('features/backend/test_data/book.yml')
  end

  def login_data
    Tools::YamlLoader.read_yaml('features/frontend/test_data/credentials.yml')
  end

  def oauth_data
    Tools::YamlLoader.read_yaml('features/backend/test_data/ouath.yml')
  end

  private

  def replace_path
    $scenario
        .location
        .file
        .gsub(/\btest\b/, 'test_data')
        .gsub(/\bfeature\b/, 'yml')
  end

end
