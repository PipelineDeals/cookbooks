maintainer        "PipelineDeals, LLC."
maintainer_email  "cookbooks@pipelinedealsco.com"
license           "Apache 2.0"
description       "Packages essential tools for building common C/C++ based software."
version           "0.1.0"
recipe            "build-tools", "Installs the basics - gcc, bison, autoconf, make, libc, etc."
recipe            "build-tools::tcmalloc", "Installs Google's fast multi-threaded mallac()."

%w{ debian ubuntu }.each do |os|
  supports os
end
