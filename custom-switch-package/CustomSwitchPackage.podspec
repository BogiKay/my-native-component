# `.podspec` file is like "`package.json`" for iOS CocoaPods packages

require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

# Detect if new arch is enabled
new_arch_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'

Pod::Spec.new do |s|
  s.name            = "CustomSwitchPackage"
  s.version         = package["version"]
  s.summary         = package["description"]
  s.description     = package["description"]
  s.homepage        = package["homepage"]
  s.license         = package["license"]
  s.platforms       = { :ios => "13.0" }
  s.author          = package["author"]
  s.source          = { :git => package["repository"], :tag => "#{s.version}" }

  # This is crucial - declare which files will be included in the package (similar to "files" field in `package.json`)
  s.source_files    = "ios/**/*.{h,m,mm,swift}"

  if new_arch_enabled
    s.pod_target_xcconfig = {
      "DEFINES_MODULE" => "YES",
      "SWIFT_OBJC_INTERFACE_HEADER_NAME" => "CustomSwitchPackage-Swift.h",
      # This is handy when we want to detect if new arch is enabled in Swift code
      # and can be used like:
      # #if RANGE_SLIDER_PACKAGE_NEW_ARCH_ENABLED
      # // do sth when new arch is enabled
      # #else
      # // do sth when old arch is enabled
      # #endif
      "OTHER_SWIFT_FLAGS" => "-DCUSTOM_SWITCH_PACKAGE_NEW_ARCH_ENABLED"
    }
  else
    s.pod_target_xcconfig = {
      "DEFINES_MODULE" => "YES",
      "SWIFT_OBJC_INTERFACE_HEADER_NAME" => "CustomSwitchPackage-Swift.h"
    }
  end

  # Install all React Native dependencies (RN >= 0.71 must be used)
  #
  # check source code for more context
  # https://github.com/facebook/react-native/blob/0.71-stable/scripts/react_native_pods.rb#L172#L180
  install_modules_dependencies(s)
end