# To run tests you need:
1. Ruby in version 2.1.*
2. For Firefox an installed Firefox Browser
3. For Chrome you have to download 'chromedriver' from:
[http://chromedriver.storage.googleapis.com/index.html](http://chromedriver.storage.googleapis.com/index.html)
and put it on your PATH bundler
4. Clone repo, run "bundle" and you are ready to go. 

In case of troubles see trouble.shot (below)

## Usage
1. Provide your credentials in 'config/settings.yml' file
2. Run tests with rspec, e.g: 'BROWSER=firefox rspec spec/general/tasks_spec.rb'

# Development
We use [http://rspec.info/](RSpec) as our test runner, [https://github.com/cheezy/page-object](cheezy/page-object) as our Page-Object Pattern implementation

## Debugging in pry
You can use pry to stop test execution. Just add "binding.pry" in code where you need it. 
Type 'exit' to continue or 'exit!' to stop the test.

# What's next?
Commit your code:)

###Trouble.shot
Assuming that installation of this environment on Linux/OsX is straightforward to the limits, you are probably using a windows.

This is detailed installation:

1. Install ruby 2.1.x with [RubyInstaller](http://rubyinstaller.org/downloads/) and DevKit for it (for proper version of ruby)
2. Installers should update $PATH on they own but make sure it is done properly. Basically "<Ruby_path>\bin", "<DevKit_path>\bin", "<DevKit_path>\mingq\bin" should be in you $PATH in the system variable not the user variable).
3. Install [Git](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (you probably want to use it in windows command line to select proper options during installation)
4. Open some shell and run "gem install bundler" (if you get ssh error see below)
5. Clone repo go to directory and run "bundle install" (if you get problem with DevKit go to p.2)
6. Download chromedriver and put it in $PATH like you did with ruby and DevKit1. 

Now you are ready to run some tests.

1. Set browser in env variable like 'set BROWSER = "chrome"' or '$env:BROWSER = "chrome"' or 'setx BROWSER "chrome"' or whatever 
2. Go to repo path and run tests "rspec spec\general\<your_spec>.rb"

#####What about ssh errors
If you see on of those it means you will need to [update rubygems](https://gist.github.com/luislavena/f064211759ee0f806c88#installing-using-update-packages-new)