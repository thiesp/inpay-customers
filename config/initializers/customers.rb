module Facades; end

Rails.autoloaders.main.push_dir("#{Customers::Engine.root}/app/facades", namespace: Facades)