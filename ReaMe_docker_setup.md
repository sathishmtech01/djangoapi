### Docker Project setup
#####url : https://docs.docker.com/compose/django/

1. Create a Dockerfile inside the project folder
    
        FROM python:3
        ENV PYTHONUNBUFFERED 1
        RUN mkdir /djangoapi
        WORKDIR /djangoapi
        ADD requirements.txt /djangoapi/
        RUN pip install -r requirements.txt
        ADD . /djangoapi/

2. Create a docker-compose.yml inside the project folder

        version: '3'
        
        services:
          web:
            build: .
            command: python3 manage.py runserver 0.0.0.0:8000
            volumes:
              - .:/djangoapi
            ports:
              - "8000:8000"
              
3. Install docker for linux

        chose platform : https://docs.docker.com/install/#supported-platforms
        installation page : https://docs.docker.com/install/linux/docker-ce/ubuntu/
   
   
Detailed process

    csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ source activate djangoapi
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo apt-get remove docker docker-engine docker.io containerd runc
    [sudo] password for csk: 
        Reading package lists... Done
        Building dependency tree       
        Reading state information... Done
        Package 'docker-engine' is not installed, so not removed
        Package 'docker' is not installed, so not removed
        Package 'containerd' is not installed, so not removed
        Package 'docker.io' is not installed, so not removed
        Package 'runc' is not installed, so not removed
        0 upgraded, 0 newly installed, 0 to remove and 560 not upgraded.
        (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo apt-get update
        Ign:1 http://dl.google.com/linux/chrome/deb stable InRelease
        Hit:2 https://repo.skype.com/deb stable InRelease    
        Get:3 http://dl.google.com/linux/chrome/deb stable Release [943 B]                                                    
        Hit:4 http://archive.ubuntu.com/ubuntu xenial InRelease                                                                                                   
        Get:5 http://dl.google.com/linux/chrome/deb stable Release.gpg [819 B]                                                                                    
        Get:6 http://archive.ubuntu.com/ubuntu xenial-updates InRelease [109 kB]                                                                                  
        Hit:7 http://archive.canonical.com/ubuntu xenial InRelease                                                               
        Get:8 http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial InRelease [23.8 kB]                 
        Get:9 http://dl.google.com/linux/chrome/deb stable/main amd64 Packages [1,109 B]                                               
        Get:10 http://security.ubuntu.com/ubuntu xenial-security InRelease [107 kB]                                                                                
        Get:11 http://archive.ubuntu.com/ubuntu xenial-backports InRelease [107 kB]                                                         
        Get:12 http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial/main amd64 Packages [13.3 kB]
        Get:13 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 Packages [900 kB]                                                            
        Get:14 http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial/main i386 Packages [13.3 kB]        
        Get:15 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages [596 kB]
        Get:16 http://archive.ubuntu.com/ubuntu xenial-updates/main i386 Packages [794 kB]                           
        Get:17 http://archive.ubuntu.com/ubuntu xenial-updates/main Translation-en [363 kB]                                                                
        Ign:18 http://dell.archive.canonical.com/updates xenial-dell InRelease                                                
        Get:19 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 DEP-11 Metadata [320 kB]     
        Get:20 http://archive.ubuntu.com/ubuntu xenial-updates/main DEP-11 64x64 Icons [227 kB]                                        
        Get:21 http://archive.ubuntu.com/ubuntu xenial-updates/universe amd64 Packages [717 kB]                                     
        Get:22 http://archive.ubuntu.com/ubuntu xenial-updates/universe i386 Packages [657 kB]                                
        Get:23 http://archive.ubuntu.com/ubuntu xenial-updates/universe Translation-en [294 kB]                         
        Get:24 http://archive.ubuntu.com/ubuntu xenial-updates/universe amd64 DEP-11 Metadata [249 kB]                        
        Hit:25 http://dell.archive.canonical.com/updates xenial-dell Release                                                          
        Get:27 http://archive.ubuntu.com/ubuntu xenial-updates/universe DEP-11 64x64 Icons [343 kB]                          
        Get:28 http://archive.ubuntu.com/ubuntu xenial-updates/multiverse amd64 DEP-11 Metadata [5,964 B]                                                                                                               
        Get:29 http://archive.ubuntu.com/ubuntu xenial-updates/multiverse DEP-11 64x64 Icons [14.3 kB]                                                                                                                  
        Get:30 http://archive.ubuntu.com/ubuntu xenial-backports/main amd64 Packages [7,280 B]                                                                                                                          
        Get:31 http://security.ubuntu.com/ubuntu xenial-security/main i386 Packages [506 kB]                                                                                                                            
        Get:32 http://archive.ubuntu.com/ubuntu xenial-backports/main i386 Packages [7,288 B]                                                                                                                           
        Get:33 http://archive.ubuntu.com/ubuntu xenial-backports/main amd64 DEP-11 Metadata [3,324 B]                                                                                                                   
        Get:34 http://archive.ubuntu.com/ubuntu xenial-backports/universe amd64 DEP-11 Metadata [5,104 B]                                                                                                               
        Get:35 http://security.ubuntu.com/ubuntu xenial-security/main Translation-en [248 kB]                                                                                                                           
        Get:36 http://security.ubuntu.com/ubuntu xenial-security/main amd64 DEP-11 Metadata [67.7 kB]                                                                                                                   
        Get:37 http://security.ubuntu.com/ubuntu xenial-security/main DEP-11 64x64 Icons [68.0 kB]                                                                                                                      
        Get:38 http://security.ubuntu.com/ubuntu xenial-security/universe amd64 Packages [411 kB]                                                                                                                       
        Get:39 http://security.ubuntu.com/ubuntu xenial-security/universe i386 Packages [356 kB]                                                                                                                        
        Get:40 http://security.ubuntu.com/ubuntu xenial-security/universe Translation-en [161 kB]                                                                                                                       
        Get:41 http://security.ubuntu.com/ubuntu xenial-security/universe amd64 DEP-11 Metadata [109 kB]                                                                                                                
        Get:42 http://security.ubuntu.com/ubuntu xenial-security/universe DEP-11 64x64 Icons [158 kB]                                                                                                                   
        Fetched 7,963 kB in 9s (818 kB/s)                                                                                                                                                                               
        Reading package lists... Done

Next.

    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo apt-get install \
        >     apt-transport-https \
        >     ca-certificates \
        >     curl \
        >     software-properties-common
        Reading package lists... Done
        Building dependency tree       
        Reading state information... Done
        ca-certificates is already the newest version (20170717~16.04.1).
        The following additional packages will be installed:
          libcurl3-gnutls python3-software-properties software-properties-gtk
        The following NEW packages will be installed:
          curl
        The following packages will be upgraded:
          apt-transport-https libcurl3-gnutls python3-software-properties software-properties-common software-properties-gtk
        5 upgraded, 1 newly installed, 0 to remove and 555 not upgraded.
        Need to get 427 kB of archives.
        After this operation, 350 kB of additional disk space will be used.
        Do you want to continue? [Y/n] Y
        Get:1 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libcurl3-gnutls amd64 7.47.0-1ubuntu2.11 [185 kB]
        Get:2 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 apt-transport-https amd64 1.2.29 [26.2 kB]
        Get:3 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 curl amd64 7.47.0-1ubuntu2.11 [139 kB]
        Get:4 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 software-properties-common all 0.96.20.7 [9,452 B]
        Get:5 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 software-properties-gtk all 0.96.20.7 [47.2 kB]
        Get:6 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 python3-software-properties all 0.96.20.7 [20.3 kB]
        Fetched 427 kB in 1s (270 kB/s)                       
        (Reading database ... 217690 files and directories currently installed.)
        Preparing to unpack .../libcurl3-gnutls_7.47.0-1ubuntu2.11_amd64.deb ...
        Unpacking libcurl3-gnutls:amd64 (7.47.0-1ubuntu2.11) over (7.47.0-1ubuntu2.9) ...
        Preparing to unpack .../apt-transport-https_1.2.29_amd64.deb ...
        Unpacking apt-transport-https (1.2.29) over (1.2.15ubuntu0.2) ...
        Selecting previously unselected package curl.
        Preparing to unpack .../curl_7.47.0-1ubuntu2.11_amd64.deb ...
        Unpacking curl (7.47.0-1ubuntu2.11) ...
        Preparing to unpack .../software-properties-common_0.96.20.7_all.deb ...
        Unpacking software-properties-common (0.96.20.7) over (0.96.20) ...
        Preparing to unpack .../software-properties-gtk_0.96.20.7_all.deb ...
        Unpacking software-properties-gtk (0.96.20.7) over (0.96.20) ...
        Preparing to unpack .../python3-software-properties_0.96.20.7_all.deb ...
        Unpacking python3-software-properties (0.96.20.7) over (0.96.20) ...
        Processing triggers for libc-bin (2.23-0ubuntu10) ...
        Processing triggers for man-db (2.7.5-1) ...
        Processing triggers for dbus (1.10.6-1ubuntu3.1) ...
        Processing triggers for shared-mime-info (1.5-2) ...
        Processing triggers for gnome-menus (3.13.3-6ubuntu3) ...
        Processing triggers for desktop-file-utils (0.22-1ubuntu5) ...
        Processing triggers for bamfdaemon (0.5.3~bzr0+16.04.20160415-0ubuntu1) ...
        Rebuilding /usr/share/applications/bamf-2.index...
        Processing triggers for mime-support (3.59ubuntu1) ...
        Processing triggers for hicolor-icon-theme (0.15-0ubuntu1) ...
        Setting up libcurl3-gnutls:amd64 (7.47.0-1ubuntu2.11) ...
        Setting up apt-transport-https (1.2.29) ...
        Setting up curl (7.47.0-1ubuntu2.11) ...
        Setting up python3-software-properties (0.96.20.7) ...
        Setting up software-properties-common (0.96.20.7) ...
        Setting up software-properties-gtk (0.96.20.7) ...
        Processing triggers for libc-bin (2.23-0ubuntu10) ...
        (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        OK
        (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo apt-key fingerprint 0EBFCD88
        pub   4096R/0EBFCD88 2017-02-22
              Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
        uid                  Docker Release (CE deb) <docker@docker.com>
        sub   4096R/F273FCD8 2017-02-22

Next

    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$  sudo add-apt-repository \
    >    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    >    $(lsb_release -cs) \
    >    stable"
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo apt-get update
    Ign:1 http://dl.google.com/linux/chrome/deb stable InRelease
    Hit:2 https://repo.skype.com/deb stable InRelease
    Get:3 https://download.docker.com/linux/ubuntu xenial InRelease [66.2 kB]                                
    Hit:4 http://dl.google.com/linux/chrome/deb stable Release                                                                            
    Hit:6 http://archive.canonical.com/ubuntu xenial InRelease                                               
    Get:7 https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages [5,491 B]
    Hit:8 http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial InRelease      
    Hit:9 http://archive.ubuntu.com/ubuntu xenial InRelease                                                                                            
    Hit:10 http://archive.ubuntu.com/ubuntu xenial-updates InRelease                                                                                   
    Ign:11 http://dell.archive.canonical.com/updates xenial-dell InRelease
    Hit:12 http://security.ubuntu.com/ubuntu xenial-security InRelease
    Hit:13 http://archive.ubuntu.com/ubuntu xenial-backports InRelease       
    Hit:14 http://dell.archive.canonical.com/updates xenial-dell Release
    Fetched 71.7 kB in 2s (24.4 kB/s)
    Reading package lists... Done
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo apt-get install docker-ce
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following additional packages will be installed:
      aufs-tools cgroupfs-mount containerd.io docker-ce-cli libseccomp2 pigz
    The following NEW packages will be installed:
      aufs-tools cgroupfs-mount containerd.io docker-ce docker-ce-cli pigz
    The following packages will be upgraded:
      libseccomp2
    1 upgraded, 6 newly installed, 0 to remove and 554 not upgraded.
    Need to get 50.4 MB of archives.
    After this operation, 243 MB of additional disk space will be used.
    Do you want to continue? [Y/n] Y
    Get:1 http://archive.ubuntu.com/ubuntu xenial/universe amd64 pigz amd64 2.3.1-2 [61.1 kB]
    Get:2 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 libseccomp2 amd64 2.3.1-2.1ubuntu2~16.04.1 [38.7 kB]
    Get:3 http://archive.ubuntu.com/ubuntu xenial/universe amd64 aufs-tools amd64 1:3.2+20130722-1.1ubuntu1 [92.9 kB]
    Get:4 https://download.docker.com/linux/ubuntu xenial/stable amd64 containerd.io amd64 1.2.0-1 [19.9 MB]
    Get:5 http://archive.ubuntu.com/ubuntu xenial/universe amd64 cgroupfs-mount all 1.2 [4,970 B]
    Get:6 https://download.docker.com/linux/ubuntu xenial/stable amd64 docker-ce-cli amd64 5:18.09.0~3-0~ubuntu-xenial [13.0 MB]                                                                                    
    Get:7 https://download.docker.com/linux/ubuntu xenial/stable amd64 docker-ce amd64 5:18.09.0~3-0~ubuntu-xenial [17.4 MB]                                                                                        
    Fetched 50.4 MB in 24s (2,041 kB/s)                                                                                                                                                                             
    Selecting previously unselected package pigz.
    (Reading database ... 217697 files and directories currently installed.)
    Preparing to unpack .../pigz_2.3.1-2_amd64.deb ...
    Unpacking pigz (2.3.1-2) ...
    Preparing to unpack .../libseccomp2_2.3.1-2.1ubuntu2~16.04.1_amd64.deb ...
    Unpacking libseccomp2:amd64 (2.3.1-2.1ubuntu2~16.04.1) over (2.2.3-3ubuntu3) ...
    Processing triggers for man-db (2.7.5-1) ...
    Processing triggers for libc-bin (2.23-0ubuntu10) ...
    Setting up libseccomp2:amd64 (2.3.1-2.1ubuntu2~16.04.1) ...
    Processing triggers for libc-bin (2.23-0ubuntu10) ...
    Selecting previously unselected package aufs-tools.
    (Reading database ... 217705 files and directories currently installed.)
    Preparing to unpack .../aufs-tools_1%3a3.2+20130722-1.1ubuntu1_amd64.deb ...
    Unpacking aufs-tools (1:3.2+20130722-1.1ubuntu1) ...
    Selecting previously unselected package cgroupfs-mount.
    Preparing to unpack .../cgroupfs-mount_1.2_all.deb ...
    Unpacking cgroupfs-mount (1.2) ...
    Selecting previously unselected package containerd.io.
    Preparing to unpack .../containerd.io_1.2.0-1_amd64.deb ...
    Unpacking containerd.io (1.2.0-1) ...
    Selecting previously unselected package docker-ce-cli.
    Preparing to unpack .../docker-ce-cli_5%3a18.09.0~3-0~ubuntu-xenial_amd64.deb ...
    Unpacking docker-ce-cli (5:18.09.0~3-0~ubuntu-xenial) ...
    Selecting previously unselected package docker-ce.
    Preparing to unpack .../docker-ce_5%3a18.09.0~3-0~ubuntu-xenial_amd64.deb ...
    Unpacking docker-ce (5:18.09.0~3-0~ubuntu-xenial) ...
    Processing triggers for libc-bin (2.23-0ubuntu10) ...
    Processing triggers for man-db (2.7.5-1) ...
    Processing triggers for ureadahead (0.100.0-19) ...
    ureadahead will be reprofiled on next reboot
    Processing triggers for systemd (229-4ubuntu21.1) ...
    Setting up pigz (2.3.1-2) ...
    Setting up aufs-tools (1:3.2+20130722-1.1ubuntu1) ...
    Setting up cgroupfs-mount (1.2) ...
    Setting up containerd.io (1.2.0-1) ...
    Setting up docker-ce-cli (5:18.09.0~3-0~ubuntu-xenial) ...
    Setting up docker-ce (5:18.09.0~3-0~ubuntu-xenial) ...
    update-alternatives: using /usr/bin/dockerd-ce to provide /usr/bin/dockerd (dockerd) in auto mode
    Processing triggers for libc-bin (2.23-0ubuntu10) ...
    Processing triggers for systemd (229-4ubuntu21.1) ...
    Processing triggers for ureadahead (0.100.0-19) ...
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo docker container run hello-world
    Unable to find image 'hello-world:latest' locally
    latest: Pulling from library/hello-world
    1b930d010525: Pull complete 
    Digest: sha256:2557e3c07ed1e38f26e389462d03ed943586f744621577a99efb77324b0fe535
    Status: Downloaded newer image for hello-world:latest
    
    Hello from Docker!
    This message shows that your installation appears to be working correctly.
    
    To generate this message, Docker took the following steps:
     1. The Docker client contacted the Docker daemon.
     2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
        (amd64)
     3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
     4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.
    
    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash
    
    Share images, automate workflows, and more with a free Docker ID:
     https://hub.docker.com/
    
    For more examples and ideas, visit:
     https://docs.docker.com/get-started/
    
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ 
        

### Installing docker-compose 
 url : https://docs.docker.com/compose/install/

    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ docker -v
    Docker version 18.09.0, build 4d60db4
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100   617    0   617    0     0    308      0 --:--:--  0:00:01 --:--:--   308
    100 11.2M  100 11.2M    0     0   169k      0  0:01:07  0:01:07 --:--:--  202k
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo chmod +x /usr/local/bin/docker-compose
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ docker-compose --version
    docker-compose version 1.23.2, build 1110ad01

### COmpose the project

    docker-compose version 1.23.2, build 1110ad01
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ docker-compose up
    ERROR: Couldn't connect to Docker daemon at http+docker://localhost - is it running?
    
    If it's at a non-standard location, specify the URL with the DOCKER_HOST environment variable.
    (djangoapi) csk@csk-ai-revolution:~/PycharmProjects/djangoapi/djangoapi$ sudo docker-compose up
    Creating network "djangoapi_default" with the default driver
    Building web
    Step 1/7 : FROM python:3
    3: Pulling from library/python
    cd8eada9c7bb: Pull complete
    c2677faec825: Pull complete
    045b51e26e75: Pull complete
    83aa5374cd04: Pull complete
    ab3d5f770184: Pull complete
    9c182f2c6005: Pull complete
    5a0520185d1e: Pull complete
    ce2c35822e4d: Pull complete
    Digest: sha256:d842dbe033c7e35feb80261db100541b17ea970ece09bbbf07b2844b7dcc114e
    Status: Downloaded newer image for python:3
     ---> db1c801f1c06
    Step 2/7 : ENV PYTHONUNBUFFERED 1
     ---> Running in e2a7eacc4786
    Removing intermediate container e2a7eacc4786
     ---> c25338c072f0
    Step 3/7 : RUN mkdir /djangoapi
     ---> Running in 8fba9458c61e
    Removing intermediate container 8fba9458c61e
     ---> fe4927ab3a42
    Step 4/7 : WORKDIR /djangoapi
     ---> Running in 565f3a4e8227
    Removing intermediate container 565f3a4e8227
     ---> 43dadbc39945
    Step 5/7 : ADD requirements.txt /djangoapi/
     ---> e409d8d968d8
    Step 6/7 : RUN pip install -r requirements.txt
     ---> Running in 4ed4ed3ed027
    Collecting django (from -r requirements.txt (line 1))
      Downloading https://files.pythonhosted.org/packages/36/50/078a42b4e9bedb94efd3e0278c0eb71650ed9672cdc91bd5542953bec17f/Django-2.1.5-py3-none-any.whl (7.3MB)
    Collecting djangorestframework (from -r requirements.txt (line 2))
      Downloading https://files.pythonhosted.org/packages/99/0b/d37a5a96c5d301e23adcabcc2f3fa659fb34e6308590f95ebb50cdbe98a1/djangorestframework-3.9.0-py2.py3-none-any.whl (924kB)
    Collecting pytz (from django->-r requirements.txt (line 1))
      Downloading https://files.pythonhosted.org/packages/f8/0e/2365ddc010afb3d79147f1dd544e5ee24bf4ece58ab99b16fbb465ce6dc0/pytz-2018.7-py2.py3-none-any.whl (506kB)
    Installing collected packages: pytz, django, djangorestframework
    Successfully installed django-2.1.5 djangorestframework-3.9.0 pytz-2018.7
    Removing intermediate container 4ed4ed3ed027
     ---> 330ec2d188ba
    Step 7/7 : ADD . /djangoapi/
     ---> e58fc5d155af
    Successfully built e58fc5d155af
    Successfully tagged djangoapi_web:latest
    WARNING: Image for service web was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
    Creating djangoapi_web_1 ... done
    Attaching to djangoapi_web_1
    web_1  | Performing system checks...
    web_1  | 
    web_1  | System check identified no issues (0 silenced).
    web_1  | January 05, 2019 - 11:29:58
    web_1  | Django version 2.1.5, using settings 'djangoapi.settings'
    web_1  | Starting development server at http://0.0.0.0:8000/
    web_1  | Quit the server with CONTROL-C.
    web_1  | Invalid HTTP_HOST header: '192.168.1.6:8000'. You may need to add '192.168.1.6' to ALLOWED_HOSTS.
    web_1  | Bad Request: /idealweight
    web_1  | [05/Jan/2019 11:31:04] "POST /idealweight HTTP/1.1" 400 56478
    web_1  | [05/Jan/2019 11:31:37] "POST /idealweight HTTP/1.1" 200 31
    


### Check in postman rest api client

    POST /idealweight HTTP/1.1
    Host: 127.0.0.1:8000
    Content-Type: application/json
    Cache-Control: no-cache
    Postman-Token: c22b391a-6115-2f35-1ef1-754ad07e5ec9
    
    50
    

