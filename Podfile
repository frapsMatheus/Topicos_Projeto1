use_frameworks!

target 'Topicos1' do
	pod 'RealmSwift'
    pod 'HCSStarRatingView', '~> 1.4.5'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
