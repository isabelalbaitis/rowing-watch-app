
def shared_pods
	pod 'FitDataProtocol', '~> 2.1'
end

target 'iRow' do
	use_frameworks!
	platform :ios, '11.0'

	# Pods for iRow
	shared_pods
end

target 'iRow WatchKit App' do
	use_frameworks!
	platform :watchos, '7.4'

	# Pods for iRow WatchKit App

	target 'iRow WatchKit AppTests' do
		inherit! :search_paths
		# Pods for testing
	end

	target 'iRow WatchKit AppUITests' do
		# Pods for testing
	end
end

target 'iRow WatchKit Extension' do
	use_frameworks!
	platform :watchos, '7.4'
	
	# Pods for iRow WatchKit Extension
	shared_pods
end
