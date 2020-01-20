# initialize-kali-script

## Bash script to automate Kali's initialization

### Features
1. Make bash (terminal) to remember history forever! Never forget a command ever again!
1. Use Google and Cloudflare DNS for faster browsing experience!
1. Make apt use https. More security and of course, speed while updating and upgrading!
1. Modify Kali sources file to gain access to more packages. Get the bleeding edge updates!
1. Custom add-apt-repository to fetch Ubuntu packages! Use the following command:
	```bash
		$ /usr/sbin/add-apt-repository $ppa
	```
	For example
	```bash
		$ /usr/sbin/add-apt-repository ppa:deadsnakes/ppa
	```

### To Run this file,
1. Make sure you have an active Internet connection
1. Make sure [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git "Install git") is installed
1. [Clone](https://github.com/Deepak710/initialize-kali-script.git)/[Download](https://github.com/Deepak710/initialize-kali-script/archive/master.zip) this repo
1. Run the init_kali_repo.sh script
    ```bash
	$ chmod +x ./init_kali_repo.sh
	$ sudo ./init_kali_repo.sh
    ```
1. Wait for the script to do its magic

### Thanks
* **[Hazmirul Afiq](https://github.com/IceM4nn/mirrorscript-v2 "mirrorscript-v2") for the amazing script to get the fastest mirror automatically**
* **[blackMORE Ops](https://www.blackmoreops.com/2014/02/21/kali-linux-add-ppa-repository-add-apt-repository/ "add-apt-repository") for the add-apt-repository script**

### Versions
* **[1.0](https://github.com/Deepak710/initialize-kali-script/tree/1.0)**
  * Initial Commit

Contact Me: [Telegram](https://t.me/AzorAhoy)
