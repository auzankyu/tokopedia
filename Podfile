# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

workspace 'Tokopedia.xcworkspace'
project 'Tokopedia.xcodeproj'

def core_pod
    pod 'Moya', '~> 13.0'
    pod 'Moya-ModelMapper', '~> 9.0'
    pod 'Moya/RxSwift', '~> 13.0'
    pod 'RangeSeekSlider'
    pod 'MaterialComponents/Chips'
end

["Tokopedia", "TokopediaUITests"].each do |targetName|
  target targetName do
    inherit! :search_paths
    core_pod
  end
end

def project_path(projectName)
  return "#{projectName}/#{projectName}"
end

target 'Core' do
  project project_path("Core")
  core_pod
end

target 'Navigations' do
  project project_path("Navigations")
  core_pod
end

target 'TokopediaUIKit' do
  project project_path("TokopediaUIKit")
end

target 'Splash' do
  project project_path("Splash")
  core_pod
end

target 'Product' do
  project project_path("Product")
  core_pod
end
