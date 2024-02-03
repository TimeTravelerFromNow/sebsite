module Links
  extend ActiveSupport::Concern

  GITHUB_ASSET = "GITHUB_ICON.png"
  TWITTER_ASSET = "TWITTER_ICON.png"
  LINKEDIN_ASSET = "LINKEDIN_ICON.png"
  SKILLSHARE_ASSET = "SKILLSHARE_ICON.png"
  YOUTUBE_ASSET = "YOUTUBE_ICON.png"
  PEERTUBE_ASSET = "PEERTUBE_ICON.png"
  # music
  SPOTIFY_ASSET = "spotify-small.png"
  SOUNDCLOUD_ASSET = "soundcloud-orange.png"
  BANDCAMP_ASSET = "bandcamp-small.png"
  ERROR = "ERROR.png"

  MAJOR_PLATFORMS = ["GITHUB","TWITTER","LINKEDIN","YOUTUBE"]
  MINOR_PLATFORMS = ["SKILLSHARE","PEERTUBE","SPOTIFY", "SOUNDCLOUD","BANDCAMP"]

  ICON_PATHS = [GITHUB_ASSET,
  TWITTER_ASSET,
  LINKEDIN_ASSET,
  SKILLSHARE_ASSET,
  YOUTUBE_ASSET,
  PEERTUBE_ASSET,
  # music
  SPOTIFY_ASSET,
  SOUNDCLOUD_ASSET,
  BANDCAMP_ASSET]

  def self.icon_path_for(key) # when we need a path for elements not yet set
    case key
    when "GITHUB"
      return GITHUB_ASSET
    when "TWITTER"
      return TWITTER_ASSET
    when "LINKEDIN"
      return LINKEDIN_ASSET
    when "SKILLSHARE"
      return SKILLSHARE_ASSET
    when "YOUTUBE"
      return YOUTUBE_ASSET
    when "PEERTUBE"
      return PEERTUBE_ASSET
    when "SPOTIFY"
      return SPOTIFY_ASSET
    when "SOUNDCLOUD"
      return SOUNDCLOUD_ASSET
    when "BANDCAMP"
      return BANDCAMP_ASSET
    else
      puts "\n\n\n #### \n NO ICON PATH FOR position #{:key}. \n #### \n \n \n"
      return ERROR
    end # case position
  end # could be refactored into some sort of data structure,but it's fine here for now.
end
