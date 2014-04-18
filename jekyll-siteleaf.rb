require "siteleaf"
require "yaml"

# API settings
Siteleaf.api_key = '9649387e21de330f57861b624e785591'
Siteleaf.api_secret = '042437a22da133aafdbae4544aa50c1a'

# site settings
site_id = '531a6a965dde225b2c000001'
page_id = '531a6c285dde22d5820000e2' # blog page to import posts into
test_mode = false # change to true to test your import

# get posts from Jekyll
files = Dir.glob('_posts/*.markdown')

# loop through and add posts to Siteleaf
files.each do |file|
  puts "Creating post..."

  # set up post
  post = Siteleaf::Post.new
  post.site_id = site_id
  post.parent_id = page_id

  # read file
  content = File.read(file)

  # get front matter and body from file
  contentparts = /---(.*)---(.*)/m.match(content)
  frontmatter = YAML.load(contentparts[1])
  post.body = contentparts[2].strip

  # parse frontmatter
  post.meta = []
  post.taxonomy = []
  frontmatter.each do |k,v|
    case k
    when 'title'
      post.title = v.strip
    when 'tags', 'category'
      post.taxonomy << {"key" => k.strip, "values" => (v.is_a?(Array) ? v.strip : [v])}
    else
      post.meta << {"key" => k.strip, "value" => v..strip}
    end
  end

  # get date and slug from filename
  fileparts = /([0-9]{4}\-[0-9]{2}\-[0-9]{2})\-([A-Za-z0-9\-]+)\.markdown/.match(file)
  post.published_at = fileparts[1]
  post.slug = fileparts[2]

  # save
  puts test_mode ? post.inspect : post.save.inspect
end

# done!
puts "Success!"
