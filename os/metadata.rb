maintainer        "PipelineDeals, LLC."
maintainer_email  "cookbooks@pipelinedealsco.com"
license           "Apache 2.0"
description       "Tunes Debian/Ubuntu for a secure high performance environment (i.e. web server, database, etc)."
version           "0.1.0"

recipe            "os::default", "Executes all cookbooks."
recipe            "os::apparmor", "Stops and disables the apparmor service on Ubuntu."
recipe            "os::security", "Hardens a stock Debian/Ubuntu installation."
recipe            "os::sysctl". "Configures sysctl parameters."

supports          "debian"
supports          "ubuntu"
