platform :ios, '13.0'

target 'HeliosApp' do
  use_frameworks!

  pod 'CountryPickerView'
  pod 'FlagPhoneNumber'
  pod 'IQKeyboardManager'
  pod 'OTPTextField'
  pod 'IQKeyboardManagerSwift'
  pod 'MessageKit'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "13.0"
    end
  end
end
