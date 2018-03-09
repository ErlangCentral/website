ErlangCentral.org
=================

This is the code for [ErlangCentral.org](https://erlangcentral.org) website.

ErlangCentral.org runs on [Zotonic](http://zotonic.com), the Erlang web 
framework & CMS. The site is built with [Ginger](http://github.com/driebit/ginger),
a set of templates and styles for Zotonic created by [Driebit](https://www.driebit.nl). 

Contributions are very welcome!

Getting started
---------------

To get this site on your computer, you need take the following steps:

1. Clone Ginger:
    ```bash
    $ git clone https://github.com/driebit/ginger.git
    ```
    
2. Clone this repository into the `sites/` directory:
    ```bash
    $ git clone https://github.com/ErlangCentral/website.git sites/erlangcentral
    ```
    
3. Add the local hostname to your `/etc/hosts`:
    ```bash
    $ echo "127.0.0.1 erlangcentral.docker.test" | sudo tee -a /etc/hosts
    ```
        
4. Make sure you’ve [Docker installed](https://www.docker.com/community-edition),
   then start a Docker container that runs Zotonic: 
    ```bash
    $ make up
    ```
    
Now wait until Zotonic has booted, and you should be able to view the website
at http://erlangcentral.docker.test.

Learning more
-------------

To learn more about Zotonic, the Erlang web framework & CMS, please visit the 
[website](http://zotonic.com) and [documentation](http://docs.zotonic.com).

The [Ginger documentation](http://github.com/driebit/ginger/) is available at
GitHub. 

