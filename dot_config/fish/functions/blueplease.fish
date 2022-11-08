function blueplease --description 'Bluetooth please stop stuttering for f\'s sake.'
  sudo killall coreaudiod
  sudo killall blued
  # sudo renice -5 (pid bluetoothaudio)
  # sudo renice -5 (pid mpd)
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
  defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
  defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
  defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
  defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
  defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80
  # sudo renice -5 (pid coreaudiod)
  # sudo renice -5 (pid blued)
end
