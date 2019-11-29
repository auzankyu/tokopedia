# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

workspace 'Tokopedia.xcworkspace'
project 'Tokopedia.xcodeproj'

def core_pod
    pod 'Moya', '~> 13.0'
    pod 'Moya-ModelMapper', '~> 9.0'
    pod 'Moya/RxSwift', '~> 13.0'
end

["Tokopedia", "TokopediaUITests"].each do |targetName|
  target targetName do
    inherit! :search_paths
    core_pod
  end
end