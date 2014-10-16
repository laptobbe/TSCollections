Pod::Spec.new do |s|

  s.name         = "TSCollections"
  s.version      = "0.3.1

"
  s.summary      = "TSCollections is a set of convenience classes that represents common collection patterns. Such as a stack or queue."
  s.description  = <<-DESC
                   TSCollections is a set of convenience classes that represents common collection patterns. Such as a stack or queue.
                   DESC
  s.homepage     = "https://github.com/laptobbe/TSCollections"
  s.license      = 'MIT'
  s.author             = { "Tobias Sundstrand" => "tobias.sundstrand@gmail.com" }
  s.source       = { :git => "https://github.com/laptobbe/TSCollections.git", :tag => s.version.to_s }
  s.requires_arc = true

  s.subspec "TSStack" do |sp|
    sp.source_files = "Classes/NSMutableArray+TSStack.{h,m}"
  end

  s.subspec "TSQueue" do |os|
    os.source_files = "Classes/NSMutableArray+TSQueue.{h,m}"
  end

  s.subspec "TSExpandingArray" do |a|
    a.source_files = "Classes/TSExpandingArray.{h,m}"
  end

  s.subspec "TSTwoDimensionalArray" do |k|
    k.source_files = "Classes/TSTwoDimensionalArray.{h,m}"
    k.dependency "TSCollections/TSExpandingArray"
  end
end
