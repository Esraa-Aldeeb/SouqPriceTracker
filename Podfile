# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
pod 'AFNetworking', '~> 2.3.1'
pod 'RNActivityView'
pod 'CCBottomRefreshControl'
pod 'IQKeyboardManager'
pod 'FMDB'



end
target 'SouqPriceTracker' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!
shared_pods

  # Pods for SouqPriceTracker

  target 'SouqPriceTrackerTests' do
    inherit! :search_paths
    # Pods for testing
shared_pods
  end

  target 'SouqPriceTrackerUITests' do
    inherit! :search_paths
    # Pods for testing
shared_pods
  end

end
