maintainer        "PipelineDeals, LLC."
maintainer_email  "coobooks@pipelinedealsco.com"
license           "Apache 2.0"
description       "Installs and configures Ruby Enterprise Edition"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version           "0.2.0"

recipe "default", "Installs and configures Ruby Enterprise Edition"
recipe "kiji", "Installs Twitter's improved REE runtime for large long-running programs"

depends "build-tools"
supports "ubuntu"
supports "debian"
