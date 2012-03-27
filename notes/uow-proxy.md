# The Practical Guide to Working With The UOW Proxy on OS X

Quick note, this guide is a work in progress, if you want to help out feel free
to file an issue or pull request on my site's [project page][site_repo] on
GitHub.

[site_repo]: https://github.com/rpwll/rpwll.github.com

## Getting connected

To get on to the wireless network, just connect to the network labeled `UOW`,
not `UOW_WIRELESS`, just `UOW`. When you connect you'll be asked for your user
name and password, these are identical to your SOLS logon. Once you've
connected, you'll need to configure your proxy settings. On OS X the set up
goes something like this:

1. Click on the Wi-Fi icon in the menu bar and click *Open Network Preferences*
2. Click the *Advanced* button towards the bottom right of the window
3. Pick *Proxies* from the tabs along the top of the sheet that appears.
4. From the list of possible protocols, select *Automatic proxy configuration*
   and enter `http://www.uow.edu.au/autoproxy.pac` as the URL.
5. Save those settings and you should be able to get internet access in most apps.

**Note:** Currently Building 3 does not have the newer Wi-Fi setup that most
buildings have, in this case you'll want to connect to a network called
`ACHERNAR-BG` and follow the instructions above.

## Using common terminal applications

Unlike most GUI based apps, terminal apps tend to ignore system proxy settings.
There are workarounds, but a lot of programs will need some special
configurations.

However, for a lot of apps simply setting the `http_proxy` variable will be
enough. To do this simply type the following command into the terminal.

	$ http_proxy="USERNAME:PASSWORD@proxy.uow.edu.au:8080"
	$ HTTP_PROXY=$http_proxy

Where `USERNAME` and `PASSWORD` are replaced with your SOLS username and
password.

### Git

To use git over the UOW proxy you need to do a little extra configuration.
Simply run the following command in the terminal:

	$ git config --global http.proxy http://USERNAME:PASSWORD@proxy.uow.edu.au:8080

As before, substitute in your own username and password to get this working. In
addition to running this command you'll need to use HTTPS rather than SSH to
clone repositories. For instance:
	
	# This is how you'd clone a repo over SSH
	$ git clone git@github.com:username/repo.git
	# But that won't work, so instead use this following command
	$ git clone https://username@github.com/username/repo.git

As long as you do that you should be able to clone, pull and push repositories
without any hassle.

### Curl

To use curl with a proxy, simply pass the proxy URL as an argument using the `-x` argument like so: 

	$ curl -x http://USERNAME:PASSWORD@proxy.uow.edu.au:8080 http://www.google.com.au/

### Rubygems

To use Rubygems through a proxy simpy use the '--http-proxy` argument like so:

	$ gem install rails --http-proxy http://USERNAME:PASSWORD@proxy.uow.edu.au:8080

