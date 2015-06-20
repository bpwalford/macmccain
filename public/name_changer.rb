# albums = [
#   'color_of_everything', 'perfect_world', 'all_mac_too_mccain_easy', 'rhythm_and_dues'
# ]
#
# albums.each do |album|
#   Dir.chdir(album)
#   songs = Dir.glob('*.mp3')
#
#   songs.each do |song|
#     new_name = song.split('-').map{ |x| x.downcase }.drop(1).join('_')
#     File.rename(song, new_name)
#   end
#
#   Dir.chdir('..')
# end
